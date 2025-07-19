#!/bin/bash

# Terminal Cursor Customization

echo "🖱️ Terminal Cursor Styles"
echo "1) █ Block (default)"
echo "2) | Vertical bar"
echo "3) _ Underline"
echo "4) 🟦 Blinking block"
echo "5) 📍 Blinking bar"
echo "6) 🔲 Blinking underline"
echo -e "\nChoose cursor style (1-6): "
read choice

case $choice in
    1) echo -e "\e[2 q" ;;  # Steady block
    2) echo -e "\e[6 q" ;;  # Steady bar
    3) echo -e "\e[4 q" ;;  # Steady underline
    4) echo -e "\e[1 q" ;;  # Blinking block
    5) echo -e "\e[5 q" ;;  # Blinking bar
    6) echo -e "\e[3 q" ;;  # Blinking underline
    *) echo "Invalid choice!" ;;
esac

echo "✨ Cursor style applied!"