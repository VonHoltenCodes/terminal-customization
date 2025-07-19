#!/bin/bash

# Terminal Customization Suite - Main Launcher

# Colors for the menu
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m' # No Color

function show_header() {
    clear
    echo -e "${CYAN}"
    echo "╔════════════════════════════════════════════════════════╗"
    echo "║                                                        ║"
    echo "║        TERMINAL CUSTOMIZATION SUITE                    ║"
    echo "║                 Main Menu                              ║"
    echo "║                                                        ║"
    echo "╚════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

function show_menu() {
    echo -e "${GREEN}Visual Customization${NC}"
    echo "  1) 🎨 Terminal Themes         - Change terminal colors"
    echo "  2) 🖥️  Monitor Effects        - Apply screen color filters"
    echo "  3) 🌫️  Transparency           - Control terminal opacity"
    echo "  4) 🔤 Font Switcher          - Change terminal fonts"
    echo "  5) 🖱️  Cursor Styles          - Customize cursor appearance"
    echo ""
    echo -e "${YELLOW}Fun Effects${NC}"
    echo "  6) 🎪 Special Effects        - Matrix rain, typing demo, etc"
    echo "  7) 🎨 Animated ASCII         - Spinning globes, fire, dancing"
    echo "  8) 🔔 Sound Effects          - Terminal beeps and sounds"
    echo ""
    echo -e "${BLUE}Productivity Tools${NC}"
    echo "  9) 📊 System Stats           - Live monitoring dashboard"
    echo " 10) 🌤️  Weather Integration    - Weather info and forecasts"
    echo " 11) 🔀 Git Prompt Setup       - Git-aware terminal prompt"
    echo ""
    echo -e "${PURPLE}Entertainment${NC}"
    echo " 12) 🎮 Terminal Games         - Snake, Tetris, and more"
    echo ""
    echo -e "${RED}System${NC}"
    echo " 13) 📚 View README            - Documentation"
    echo " 14) 🔄 Refresh Aliases        - Reload bashrc"
    echo " 15) ❌ Exit"
    echo ""
}

function run_script() {
    script_path="$1"
    if [ -f "$script_path" ]; then
        bash "$script_path"
        echo ""
        read -p "Press Enter to return to menu..."
    else
        echo "Error: Script not found!"
        sleep 2
    fi
}

function view_readme() {
    if command -v less &> /dev/null; then
        less ~/repos/projects/terminal-customization/README.md
    else
        cat ~/repos/projects/terminal-customization/README.md | more
    fi
}

function refresh_aliases() {
    source ~/.bashrc
    echo "✅ Aliases refreshed! You can now use:"
    echo ""
    echo "  themes, monitor, transparency, fonts, cursor,"
    echo "  effects, ascii, sounds, stats, weather,"
    echo "  gitprompt, games"
    echo ""
    read -p "Press Enter to continue..."
}

# Main loop
while true; do
    show_header
    show_menu
    
    read -p "Enter your choice (1-15): " choice
    
    case $choice in
        1) run_script ~/repos/projects/terminal-customization/theme-switcher.sh ;;
        2) run_script ~/repos/projects/terminal-customization/monitor-effects.sh ;;
        3) run_script ~/repos/projects/terminal-customization/transparency.sh ;;
        4) run_script ~/repos/projects/terminal-customization/font-switcher.sh ;;
        5) run_script ~/repos/projects/terminal-customization/cursor-styles.sh ;;
        6) run_script ~/repos/projects/terminal-customization/fun-effects.sh ;;
        7) run_script ~/repos/projects/terminal-customization/animated-ascii.sh ;;
        8) run_script ~/repos/projects/terminal-customization/sound-effects.sh ;;
        9) run_script ~/repos/projects/terminal-customization/system-stats.sh ;;
        10) run_script ~/repos/projects/terminal-customization/weather-prompt.sh ;;
        11) run_script ~/repos/projects/terminal-customization/git-prompt.sh ;;
        12) run_script ~/repos/projects/terminal-customization/terminal-games.sh ;;
        13) view_readme ;;
        14) refresh_aliases ;;
        15) 
            echo -e "\n${CYAN}Thanks for using Terminal Customization Suite!${NC}"
            echo "Remember: You can access any feature directly with these commands:"
            echo "themes, monitor, effects, cursor, sounds, ascii, transparency,"
            echo "fonts, games, stats, weather, gitprompt"
            echo ""
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid choice! Please try again.${NC}"
            sleep 1
            ;;
    esac
done