#!/bin/bash

# Terminal Font Switcher

function set_font() {
    font_name="$1"
    font_size="$2"
    
    # For GNOME Terminal
    profile=$(gsettings get org.gnome.Terminal.ProfilesList default 2>/dev/null | tr -d "'")
    
    if [ -n "$profile" ]; then
        gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/ use-system-font false
        gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/ font "$font_name $font_size"
        echo "✨ Font set to $font_name $font_size"
    else
        echo "⚠️  Manual configuration needed for your terminal"
    fi
}

echo "🔤 Terminal Font Switcher"
echo "1) 💻 Monospace Regular 12"
echo "2) 🤖 Ubuntu Mono 14"
echo "3) 🎮 Hack 13"
echo "4) 📟 Source Code Pro 12"
echo "5) 🖥️ DejaVu Sans Mono 13"
echo "6) 🎯 Fira Code 12"
echo "7) 🔍 Large Text (16pt)"
echo "8) 🔬 Small Text (10pt)"
echo -e "\nChoose font style (1-8): "
read choice

case $choice in
    1) set_font "Monospace Regular" "12" ;;
    2) set_font "Ubuntu Mono" "14" ;;
    3) set_font "Hack" "13" ;;
    4) set_font "Source Code Pro" "12" ;;
    5) set_font "DejaVu Sans Mono" "13" ;;
    6) set_font "Fira Code" "12" ;;
    7) set_font "Monospace Regular" "16" ;;
    8) set_font "Monospace Regular" "10" ;;
    *) echo "Invalid choice!" ;;
esac