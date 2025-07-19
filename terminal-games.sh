#!/bin/bash

# Terminal Games Menu

function install_game() {
    game=$1
    echo "Installing $game..."
    echo "VonHolten2025" | sudo -S apt install -y $game 2>/dev/null || echo "❌ Failed to install $game"
}

function snake_game() {
    if ! command -v nsnake &> /dev/null; then
        install_game nsnake
    fi
    nsnake
}

function tetris_game() {
    if ! command -v bastet &> /dev/null; then
        install_game bastet
    fi
    bastet
}

function moon_buggy() {
    if ! command -v moon-buggy &> /dev/null; then
        install_game moon-buggy
    fi
    moon-buggy
}

function simple_snake() {
    # Built-in snake game using bash
    echo "🐍 Simple Snake (Use WASD to move, Q to quit)"
    sleep 2
    
    width=40
    height=20
    snake_x=20
    snake_y=10
    food_x=$((RANDOM % width))
    food_y=$((RANDOM % height))
    direction="right"
    
    clear
    stty -echo -icanon
    
    while true; do
        # Draw border
        clear
        for ((i=0; i<height; i++)); do
            for ((j=0; j<width; j++)); do
                if [ $i -eq 0 ] || [ $i -eq $((height-1)) ] || [ $j -eq 0 ] || [ $j -eq $((width-1)) ]; then
                    echo -n "#"
                elif [ $i -eq $snake_y ] && [ $j -eq $snake_x ]; then
                    echo -n "O"
                elif [ $i -eq $food_y ] && [ $j -eq $food_x ]; then
                    echo -n "*"
                else
                    echo -n " "
                fi
            done
            echo
        done
        
        # Read input
        read -t 0.1 -n 1 key
        case $key in
            w) direction="up" ;;
            s) direction="down" ;;
            a) direction="left" ;;
            d) direction="right" ;;
            q) break ;;
        esac
        
        # Move snake
        case $direction in
            up) ((snake_y--)) ;;
            down) ((snake_y++)) ;;
            left) ((snake_x--)) ;;
            right) ((snake_x++)) ;;
        esac
        
        # Check collision
        if [ $snake_x -le 0 ] || [ $snake_x -ge $((width-1)) ] || [ $snake_y -le 0 ] || [ $snake_y -ge $((height-1)) ]; then
            echo -e "\n💀 Game Over!"
            break
        fi
        
        # Check food
        if [ $snake_x -eq $food_x ] && [ $snake_y -eq $food_y ]; then
            food_x=$((RANDOM % (width-2) + 1))
            food_y=$((RANDOM % (height-2) + 1))
        fi
    done
    
    stty echo icanon
}

function number_guess() {
    echo "🎲 Number Guessing Game"
    echo "I'm thinking of a number between 1-100"
    
    number=$((RANDOM % 100 + 1))
    attempts=0
    
    while true; do
        read -p "Your guess: " guess
        ((attempts++))
        
        if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
            echo "Please enter a valid number!"
            continue
        fi
        
        if [ $guess -eq $number ]; then
            echo "🎉 Correct! You got it in $attempts attempts!"
            break
        elif [ $guess -lt $number ]; then
            echo "📈 Higher!"
        else
            echo "📉 Lower!"
        fi
    done
}

# Menu
echo "🎮 Terminal Games"
echo "1) 🐍 Snake (nsnake)"
echo "2) 🧱 Tetris (bastet)"
echo "3) 🚙 Moon Buggy"
echo "4) 🐍 Simple Snake (built-in)"
echo "5) 🎲 Number Guessing"
echo "6) 🕹️ Install all games"
echo -e "\nChoose game (1-6): "
read choice

case $choice in
    1) snake_game ;;
    2) tetris_game ;;
    3) moon_buggy ;;
    4) simple_snake ;;
    5) number_guess ;;
    6) 
        install_game nsnake
        install_game bastet
        install_game moon-buggy
        echo "✅ All games installed!"
        ;;
    *) echo "Invalid choice!" ;;
esac