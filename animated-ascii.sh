#!/bin/bash

# Animated ASCII Art

function spinning_globe() {
    frames=("🌍" "🌎" "🌏")
    echo -e "\nSpinning Globe (Press Ctrl+C to stop)"
    while true; do
        for frame in "${frames[@]}"; do
            printf "\r  %s  " "$frame"
            sleep 0.3
        done
    done
}

function loading_bar() {
    echo -e "\nLoading Animation Demo:\n"
    width=50
    for ((i=0; i<=width; i++)); do
        progress=$((i*100/width))
        bar=$(printf "%-${width}s" "$(printf '█%.0s' $(seq 1 $i))")
        printf "\r[%s] %d%%" "$bar" "$progress"
        sleep 0.05
    done
    echo -e "\n✅ Complete!\n"
}

function bouncing_ball() {
    echo -e "\nBouncing Ball (Press Ctrl+C to stop)\n"
    positions=("    ⚪" "   ⚪ " "  ⚪  " " ⚪   " "⚪    " " ⚪   " "  ⚪  " "   ⚪ ")
    while true; do
        for pos in "${positions[@]}"; do
            printf "\r%s" "$pos"
            sleep 0.1
        done
    done
}

function matrix_cascade() {
    echo -e "\nMatrix Cascade (Press Ctrl+C to stop)"
    cols=$(tput cols)
    lines=$(tput lines)
    
    for ((i=0; i<lines; i++)); do
        for ((j=0; j<cols; j++)); do
            if (( RANDOM % 10 < 3 )); then
                printf "\033[1;32m%c\033[0m" $((RANDOM % 2))
            else
                printf " "
            fi
        done
        sleep 0.05
    done
}

function dancing_stick() {
    frames=(
        "  o  \n /|\ \n / \ "
        " \o  \n  |\ \n /|  "
        "  o/ \n /|  \n  |\ "
        " \o/ \n  |  \n / \ "
    )
    echo -e "\nDancing Stick Figure (Press Ctrl+C to stop)\n"
    while true; do
        for frame in "${frames[@]}"; do
            printf "\r\033[3A%s" "$frame"
            sleep 0.3
        done
    done
}

function fire_animation() {
    colors=("🔥" "🟧" "🟨" "⬜")
    echo -e "\nFire Animation (Press Ctrl+C to stop)\n"
    width=20
    height=5
    
    while true; do
        output=""
        for ((h=0; h<height; h++)); do
            for ((w=0; w<width; w++)); do
                idx=$((RANDOM % 4))
                output+="${colors[$idx]}"
            done
            output+="\n"
        done
        printf "\033[${height}A%s" "$output"
        sleep 0.1
    done
}

# Menu
echo "🎨 Animated ASCII Art"
echo "1) 🌍 Spinning Globe"
echo "2) ⏳ Loading Bar"
echo "3) ⚪ Bouncing Ball"
echo "4) 💻 Matrix Cascade"
echo "5) 🕺 Dancing Stick Figure"
echo "6) 🔥 Fire Animation"
echo -e "\nChoose animation (1-6): "
read choice

case $choice in
    1) spinning_globe ;;
    2) loading_bar ;;
    3) bouncing_ball ;;
    4) matrix_cascade ;;
    5) dancing_stick ;;
    6) fire_animation ;;
    *) echo "Invalid choice!" ;;
esac