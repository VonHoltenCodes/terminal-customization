#!/bin/bash

# Fun Terminal Effects Script

function matrix_rain() {
    echo "Starting Matrix rain effect... (Press Ctrl+C to stop)"
    sleep 2
    # Matrix rain effect
    LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"
}

function typing_effect() {
    echo -e "\n📝 Typing Effect Demo\n"
    text="Welcome to the terminal customization suite! This text appears as if being typed..."
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep 0.05
    done
    echo -e "\n"
}

function rainbow_prompt() {
    echo "🌈 Installing rainbow prompt..."
    echo 'PS1="\[\033[38;5;196m\]➜ \[\033[38;5;202m\]\u\[\033[38;5;226m\]@\[\033[38;5;082m\]\h \[\033[38;5;021m\]\w \[\033[38;5;093m\]$ \[\033[0m\]"' > ~/.bashrc_rainbow
    echo "Run: source ~/.bashrc_rainbow"
}

function ascii_art_banner() {
    echo '
    ╔═══════════════════════════════════════╗
    ║  ████████╗███████╗██████╗ ███╗   ███╗ ║
    ║  ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║ ║
    ║     ██║   █████╗  ██████╔╝██╔████╔██║ ║
    ║     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║ ║
    ║     ██║   ███████╗██║  ██║██║ ╚═╝ ██║ ║
    ║     ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ║
    ╚═══════════════════════════════════════╝
    '
}

function random_fortune() {
    fortunes=(
        "🎯 Your terminal skills are improving!"
        "💻 Code is poetry in motion"
        "🚀 To infinity and beyond!"
        "🎨 Creativity is intelligence having fun"
        "⚡ With great power comes great electricity bills"
        "🌟 May the source be with you"
        "🔧 It works on my machine™"
        "☕ Coffee not found - programmer halted"
    )
    echo -e "\n${fortunes[$RANDOM % ${#fortunes[@]}]}\n"
}

function glitch_text() {
    text="${1:-TERMINAL CUSTOMIZATION}"
    glitch_chars="@#$%&*!?"
    
    echo -e "\n"
    for i in {1..10}; do
        output=""
        for ((j=0; j<${#text}; j++)); do
            if (( RANDOM % 3 == 0 )); then
                output+="${glitch_chars:RANDOM%8:1}"
            else
                output+="${text:j:1}"
            fi
        done
        printf "\r\033[K%s" "$output"
        sleep 0.1
    done
    printf "\r\033[K%s\n\n" "$text"
}

function neon_clock() {
    echo -e "\n🕒 Neon Clock (Press Ctrl+C to stop)\n"
    while true; do
        printf "\r\033[1;36m[\033[1;35m$(date +%H:%M:%S)\033[1;36m]\033[0m"
        sleep 1
    done
}

# Menu
echo "🎪 Fun Terminal Effects Menu"
echo "1) 💻 Matrix Rain"
echo "2) ⌨️  Typing Effect Demo"
echo "3) 🌈 Install Rainbow Prompt"
echo "4) 🎨 ASCII Art Banner"
echo "5) 🔮 Random Fortune"
echo "6) 📺 Glitch Text Effect"
echo "7) 🕒 Neon Clock"
echo -e "\nChoose effect (1-7): "
read choice

case $choice in
    1) matrix_rain ;;
    2) typing_effect ;;
    3) rainbow_prompt ;;
    4) ascii_art_banner ;;
    5) random_fortune ;;
    6) glitch_text ;;
    7) neon_clock ;;
    *) echo "Invalid choice!" ;;
esac