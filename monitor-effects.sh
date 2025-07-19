#!/bin/bash

# Monitor Color Effects Script

echo "🎨 Monitor Color Effects"
echo "1) 🟠 Amber/Orange CRT"
echo "2) 🟢 Green Phosphor Terminal"  
echo "3) 🔵 Blue Night Mode"
echo "4) 🔴 Red Dark Room"
echo "5) 🟣 Cyberpunk Purple"
echo "6) 🌅 Warm Sunset"
echo "7) ❄️  Cool Blue"
echo "8) 🩸 Deep Blood Red"
echo "9) 🔄 Reset to Normal"
echo -e "\nChoose effect (1-9): "
read choice

case $choice in
    1) xrandr --output DVI-I-1 --gamma 1.0:0.7:0.5 ;;  # Orange
    2) xrandr --output DVI-I-1 --gamma 0.5:1.0:0.5 ;;  # Green
    3) xrandr --output DVI-I-1 --gamma 0.7:0.8:1.0 ;;  # Blue
    4) xrandr --output DVI-I-1 --gamma 1.0:0.5:0.5 ;;  # Red
    5) xrandr --output DVI-I-1 --gamma 1.0:0.6:1.0 ;;  # Purple
    6) xrandr --output DVI-I-1 --gamma 1.0:0.8:0.6 ;;  # Warm
    7) xrandr --output DVI-I-1 --gamma 0.9:0.9:1.0 ;;  # Cool
    8) xrandr --output DVI-I-1 --gamma 1.2:0.3:0.3 ;;  # Blood Red
    9) xrandr --output DVI-I-1 --gamma 1.0:1.0:1.0 ;;  # Reset
    *) echo "Invalid choice!" ;;
esac

echo "✨ Effect applied!"