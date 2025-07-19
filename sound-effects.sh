#!/bin/bash

# Terminal Sound Effects

function beep_pattern() {
    echo "🔊 Playing beep pattern..."
    for i in {1..3}; do
        echo -e "\a"
        sleep 0.2
    done
}

function command_sounds() {
    echo "🎵 Installing command completion sounds..."
    cat >> ~/.bashrc_sounds << 'EOF'
# Play sound after command completion
PROMPT_COMMAND='[ $? -eq 0 ] && echo -e "\a" || (echo -e "\a\a")'
EOF
    echo "Add 'source ~/.bashrc_sounds' to enable"
}

function startup_chime() {
    echo "🎶 Terminal startup chime..."
    for freq in 523 587 659 698 784; do
        play -n synth 0.1 sine $freq 2>/dev/null || echo -e "\a"
        sleep 0.05
    done
}

echo "🔔 Terminal Sound Effects"
echo "1) 📢 Beep Pattern"
echo "2) 🎵 Command Completion Sounds"
echo "3) 🎶 Startup Chime (requires 'sox')"
echo -e "\nChoose effect (1-3): "
read choice

case $choice in
    1) beep_pattern ;;
    2) command_sounds ;;
    3) startup_chime ;;
    *) echo "Invalid choice!" ;;
esac