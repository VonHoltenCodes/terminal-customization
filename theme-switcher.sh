#!/bin/bash

# Terminal Theme Switcher

function apply_theme() {
    echo "$2" > ~/.bashrc_colors
    source ~/.bashrc
    echo -e "\n✨ Applied $1 theme! Open a new terminal to see the full effect."
}

function show_menu() {
    echo -e "\n🎨 Terminal Theme Switcher\n"
    echo "1) 🦇 Bat Computer (Matrix Green)"
    echo "2) 🌆 Cyberpunk (Red/Orange/Blue)"
    echo "3) 🌃 NeonPulse (Retro Pink/Blue)"
    echo "4) 🌊 Ocean (Current Cyan/Magenta)"
    echo "5) 🔥 Fire (Red/Yellow)"
    echo "6) 🌸 Sakura (Pink/Purple)"
    echo "7) ⚡ Electric (Yellow/Blue)"
    echo "8) 🌌 Space (Purple/Green)"
    echo -e "\nEnter your choice (1-8): "
}

# Theme definitions
BAT_THEME='# 🦇 Bat Computer Theme - Matrix Green
force_color_prompt=yes
PS1="\[\033[1;32m\][\[\033[0;32m\]\u@\h \[\033[1;32m\]\w\[\033[1;32m\]]\[\033[0;32m\]\$ \[\033[0m\]"
export CLICOLOR=1
alias ls="ls --color=auto"
alias ll="ls -alF --color=auto"
alias grep="grep --color=auto"
export LS_COLORS="di=1;32:ln=0;32:so=0;32:pi=0;32:ex=1;32:bd=0;32:cd=0;32:su=0;32:sg=0;32:tw=0;32:ow=0;32"'

CYBERPUNK_THEME='# 🌆 Cyberpunk Theme - Red/Orange/Blue
force_color_prompt=yes
PS1="\[\033[1;31m\][\[\033[1;33m\]\u\[\033[1;31m\]@\[\033[1;34m\]\h \[\033[1;31m\]\w\[\033[1;33m\]]\[\033[1;31m\]$ \[\033[0m\]"
export CLICOLOR=1
alias ls="ls --color=auto"
alias ll="ls -alF --color=auto"
alias grep="grep --color=auto"
export LS_COLORS="di=1;34:ln=1;33:so=1;31:pi=1;31:ex=1;33:bd=1;34:cd=1;34:su=1;31:sg=1;31:tw=1;34:ow=1;34"'

NEONPULSE_THEME='# 🌃 NeonPulse Theme - Retro Pink/Blue
force_color_prompt=yes
PS1="\[\033[1;35m\]▶ \[\033[1;36m\]\u\[\033[1;35m\]@\[\033[1;34m\]\h \[\033[1;35m\][\[\033[1;36m\]\w\[\033[1;35m\]] \[\033[1;35m\]➜ \[\033[0m\]"
export CLICOLOR=1
alias ls="ls --color=auto"
alias ll="ls -alF --color=auto"
alias grep="grep --color=auto"
export LS_COLORS="di=1;36:ln=1;35:so=1;35:pi=1;35:ex=1;36:bd=1;34:cd=1;34:su=1;35:sg=1;35:tw=1;36:ow=1;36"'

OCEAN_THEME='# 🌊 Ocean Theme - Cyan/Magenta
force_color_prompt=yes
PS1="\[\033[1;36m\]\u\[\033[1;35m\]@\[\033[1;36m\]\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;35m\]\$\[\033[00m\] "
export CLICOLOR=1
alias ls="ls --color=auto"
alias ll="ls -alF --color=auto"
alias grep="grep --color=auto"'

FIRE_THEME='# 🔥 Fire Theme - Red/Yellow
force_color_prompt=yes
PS1="\[\033[1;31m\]🔥 \[\033[1;33m\]\u\[\033[1;31m\]@\[\033[1;33m\]\h \[\033[1;31m\][\[\033[1;33m\]\w\[\033[1;31m\]] \[\033[1;33m\]$ \[\033[0m\]"
export CLICOLOR=1
alias ls="ls --color=auto"
alias ll="ls -alF --color=auto"
alias grep="grep --color=auto"
export LS_COLORS="di=1;33:ln=1;31:so=1;31:pi=1;31:ex=1;33:bd=1;31:cd=1;31:su=1;31:sg=1;31:tw=1;33:ow=1;33"'

SAKURA_THEME='# 🌸 Sakura Theme - Pink/Purple
force_color_prompt=yes
PS1="\[\033[1;35m\]🌸 \[\033[1;95m\]\u\[\033[1;35m\]@\[\033[1;95m\]\h \[\033[1;35m\](\[\033[1;95m\]\w\[\033[1;35m\]) \[\033[1;95m\]❯ \[\033[0m\]"
export CLICOLOR=1
alias ls="ls --color=auto"
alias ll="ls -alF --color=auto"
alias grep="grep --color=auto"
export LS_COLORS="di=1;95:ln=1;35:so=1;35:pi=1;35:ex=1;95:bd=1;35:cd=1;35:su=1;35:sg=1;35:tw=1;95:ow=1;95"'

ELECTRIC_THEME='# ⚡ Electric Theme - Yellow/Blue
force_color_prompt=yes
PS1="\[\033[1;33m\]⚡ \[\033[1;34m\]\u\[\033[1;33m\]@\[\033[1;34m\]\h \[\033[1;33m\][\[\033[1;36m\]\w\[\033[1;33m\]] \[\033[1;34m\]➤ \[\033[0m\]"
export CLICOLOR=1
alias ls="ls --color=auto"
alias ll="ls -alF --color=auto"
alias grep="grep --color=auto"
export LS_COLORS="di=1;34:ln=1;33:so=1;33:pi=1;33:ex=1;36:bd=1;34:cd=1;34:su=1;33:sg=1;33:tw=1;34:ow=1;34"'

SPACE_THEME='# 🌌 Space Theme - Purple/Green
force_color_prompt=yes
PS1="\[\033[1;35m\]🚀 \[\033[1;32m\]\u\[\033[1;35m\]@\[\033[1;32m\]\h \[\033[1;35m\][\[\033[1;36m\]\w\[\033[1;35m\]] \[\033[1;32m\]❯ \[\033[0m\]"
export CLICOLOR=1
alias ls="ls --color=auto"
alias ll="ls -alF --color=auto"
alias grep="grep --color=auto"
export LS_COLORS="di=1;36:ln=1;32:so=1;35:pi=1;35:ex=1;32:bd=1;36:cd=1;36:su=1;35:sg=1;35:tw=1;36:ow=1;36"'

# Main menu
show_menu
read -r choice

case $choice in
    1) apply_theme "Bat Computer" "$BAT_THEME" ;;
    2) apply_theme "Cyberpunk" "$CYBERPUNK_THEME" ;;
    3) apply_theme "NeonPulse" "$NEONPULSE_THEME" ;;
    4) apply_theme "Ocean" "$OCEAN_THEME" ;;
    5) apply_theme "Fire" "$FIRE_THEME" ;;
    6) apply_theme "Sakura" "$SAKURA_THEME" ;;
    7) apply_theme "Electric" "$ELECTRIC_THEME" ;;
    8) apply_theme "Space" "$SPACE_THEME" ;;
    *) echo "Invalid choice!" ;;
esac