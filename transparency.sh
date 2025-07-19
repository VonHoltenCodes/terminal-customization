#!/bin/bash

# Terminal Transparency Control

function set_transparency() {
    level=$1
    # For GNOME Terminal
    profile=$(gsettings get org.gnome.Terminal.ProfilesList default 2>/dev/null | tr -d "'")
    
    if [ -n "$profile" ]; then
        gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/ use-transparent-background true
        gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/ background-transparency-percent $level
        echo "✨ Transparency set to $level%"
    else
        echo "⚠️  GNOME Terminal not detected. Trying generic method..."
        echo -e "\033]11;[${level}]#000000\007"
    fi
}

echo "🌫️ Terminal Transparency"
echo "1) 🔲 0% (Opaque)"
echo "2) 🌫️ 10% Transparent"
echo "3) 💨 25% Transparent"
echo "4) 🌊 50% Transparent"
echo "5) 👻 75% Transparent"
echo "6) 🫥 90% Transparent"
echo -e "\nChoose transparency level (1-6): "
read choice

case $choice in
    1) set_transparency 0 ;;
    2) set_transparency 10 ;;
    3) set_transparency 25 ;;
    4) set_transparency 50 ;;
    5) set_transparency 75 ;;
    6) set_transparency 90 ;;
    *) echo "Invalid choice!" ;;
esac