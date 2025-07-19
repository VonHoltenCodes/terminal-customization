#!/bin/bash

# System Stats Dashboard

function cpu_monitor() {
    echo "🖥️ CPU Monitor (Press Ctrl+C to stop)"
    echo ""
    while true; do
        cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
        cpu_bar=""
        cpu_int=${cpu_usage%.*}
        
        for ((i=0; i<50; i++)); do
            if [ $i -lt $((cpu_int/2)) ]; then
                cpu_bar+="█"
            else
                cpu_bar+="░"
            fi
        done
        
        printf "\rCPU: [%s] %s%%" "$cpu_bar" "$cpu_usage"
        sleep 1
    done
}

function memory_status() {
    echo "💾 Memory Status"
    echo ""
    
    mem_info=$(free -h | grep "^Mem:")
    total=$(echo $mem_info | awk '{print $2}')
    used=$(echo $mem_info | awk '{print $3}')
    free=$(echo $mem_info | awk '{print $4}')
    available=$(echo $mem_info | awk '{print $7}')
    
    echo "Total:     $total"
    echo "Used:      $used"
    echo "Free:      $free"
    echo "Available: $available"
    
    # Visual bar
    used_percent=$(free | grep "^Mem:" | awk '{printf "%.0f", $3/$2 * 100}')
    bar=""
    for ((i=0; i<50; i++)); do
        if [ $i -lt $((used_percent/2)) ]; then
            bar+="█"
        else
            bar+="░"
        fi
    done
    echo -e "\nUsage: [$bar] $used_percent%"
}

function disk_usage() {
    echo "💿 Disk Usage"
    echo ""
    
    df -h | grep -E "^/dev/" | while read line; do
        device=$(echo $line | awk '{print $1}')
        size=$(echo $line | awk '{print $2}')
        used=$(echo $line | awk '{print $3}')
        avail=$(echo $line | awk '{print $4}')
        percent=$(echo $line | awk '{print $5}' | tr -d '%')
        mount=$(echo $line | awk '{print $6}')
        
        # Color based on usage
        if [ $percent -gt 90 ]; then
            color="\033[1;31m"  # Red
        elif [ $percent -gt 70 ]; then
            color="\033[1;33m"  # Yellow
        else
            color="\033[1;32m"  # Green
        fi
        
        # Visual bar
        bar=""
        for ((i=0; i<20; i++)); do
            if [ $i -lt $((percent/5)) ]; then
                bar+="█"
            else
                bar+="░"
            fi
        done
        
        printf "%s\n" "$mount"
        printf "  Size: %s  Used: %s  Free: %s\n" "$size" "$used" "$avail"
        printf "  ${color}[%s] %d%%\033[0m\n\n" "$bar" "$percent"
    done
}

function network_info() {
    echo "🌐 Network Information"
    echo ""
    
    # Get active interface
    interface=$(ip route | grep default | awk '{print $5}' | head -n1)
    
    if [ -n "$interface" ]; then
        ip_addr=$(ip addr show $interface | grep "inet " | awk '{print $2}' | cut -d'/' -f1)
        echo "Interface: $interface"
        echo "IP Address: $ip_addr"
        
        # Network speed (if available)
        if [ -f "/sys/class/net/$interface/speed" ]; then
            speed=$(cat /sys/class/net/$interface/speed 2>/dev/null || echo "Unknown")
            echo "Link Speed: ${speed}Mbps"
        fi
        
        # RX/TX bytes
        rx_bytes=$(cat /sys/class/net/$interface/statistics/rx_bytes)
        tx_bytes=$(cat /sys/class/net/$interface/statistics/tx_bytes)
        rx_mb=$((rx_bytes / 1024 / 1024))
        tx_mb=$((tx_bytes / 1024 / 1024))
        
        echo "Downloaded: ${rx_mb}MB"
        echo "Uploaded: ${tx_mb}MB"
    else
        echo "No active network interface found"
    fi
}

function live_dashboard() {
    echo "📊 Live System Dashboard (Press Ctrl+C to stop)"
    
    while true; do
        clear
        echo "╔══════════════════════════════════════════════════════╗"
        echo "║               SYSTEM STATS DASHBOARD                 ║"
        echo "╠══════════════════════════════════════════════════════╣"
        
        # CPU
        cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
        cpu_bar=""
        cpu_int=${cpu_usage%.*}
        for ((i=0; i<30; i++)); do
            if [ $i -lt $((cpu_int*30/100)) ]; then
                cpu_bar+="█"
            else
                cpu_bar+="░"
            fi
        done
        printf "║ CPU:  [%s] %5s%%     ║\n" "$cpu_bar" "$cpu_usage"
        
        # Memory
        mem_percent=$(free | grep "^Mem:" | awk '{printf "%.1f", $3/$2 * 100}')
        mem_bar=""
        mem_int=${mem_percent%.*}
        for ((i=0; i<30; i++)); do
            if [ $i -lt $((mem_int*30/100)) ]; then
                mem_bar+="█"
            else
                mem_bar+="░"
            fi
        done
        printf "║ MEM:  [%s] %5s%%     ║\n" "$mem_bar" "$mem_percent"
        
        # Disk
        disk_percent=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
        disk_bar=""
        for ((i=0; i<30; i++)); do
            if [ $i -lt $((disk_percent*30/100)) ]; then
                disk_bar+="█"
            else
                disk_bar+="░"
            fi
        done
        printf "║ DISK: [%s] %5d%%     ║\n" "$disk_bar" "$disk_percent"
        
        # Time
        current_time=$(date '+%Y-%m-%d %H:%M:%S')
        printf "║ TIME: %-46s ║\n" "$current_time"
        
        echo "╚══════════════════════════════════════════════════════╝"
        
        sleep 2
    done
}

# Menu
echo "📊 System Stats Dashboard"
echo "1) 🖥️  CPU Monitor"
echo "2) 💾 Memory Status"
echo "3) 💿 Disk Usage"
echo "4) 🌐 Network Info"
echo "5) 📊 Live Dashboard"
echo -e "\nChoose stat view (1-5): "
read choice

case $choice in
    1) cpu_monitor ;;
    2) memory_status ;;
    3) disk_usage ;;
    4) network_info ;;
    5) live_dashboard ;;
    *) echo "Invalid choice!" ;;
esac