#!/bin/bash

# Git Status in Terminal Prompt

function install_git_prompt() {
    echo "🔧 Installing Git-aware prompt..."
    
    cat > ~/.bashrc_git << 'EOF'
# Git branch and status in prompt
parse_git_branch() {
    git rev-parse --git-dir &> /dev/null
    if [ $? -eq 0 ]; then
        branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
        
        # Check for uncommitted changes
        if [[ $(git status --porcelain 2> /dev/null) ]]; then
            status="*"
        else
            status=""
        fi
        
        # Check if ahead/behind
        ahead=$(git rev-list --count @{u}..HEAD 2>/dev/null || echo "0")
        behind=$(git rev-list --count HEAD..@{u} 2>/dev/null || echo "0")
        
        if [ "$ahead" -gt 0 ] && [ "$behind" -gt 0 ]; then
            sync="⇕"
        elif [ "$ahead" -gt 0 ]; then
            sync="↑$ahead"
        elif [ "$behind" -gt 0 ]; then
            sync="↓$behind"
        else
            sync=""
        fi
        
        echo " (\[\033[1;35m\]$branch$status$sync\[\033[0m\])"
    fi
}

# Git-aware prompt with colors
PS1='\[\033[1;36m\]\u\[\033[1;35m\]@\[\033[1;36m\]\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[0m\]$(parse_git_branch)\[\033[1;35m\]\$\[\033[00m\] '
EOF
    
    echo "✅ Git prompt installed!"
    echo "Add 'source ~/.bashrc_git' to your .bashrc to enable"
}

function install_fancy_git() {
    echo "🎨 Installing fancy Git prompt with icons..."
    
    cat > ~/.bashrc_git_fancy << 'EOF'
# Fancy Git prompt with icons
parse_git_fancy() {
    if git rev-parse --git-dir &> /dev/null; then
        branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
        
        # Status icons
        icons=""
        
        # Modified files
        if [[ $(git status --porcelain | grep "^ M") ]]; then
            icons="${icons}✎"
        fi
        
        # Untracked files
        if [[ $(git status --porcelain | grep "^??") ]]; then
            icons="${icons}+"
        fi
        
        # Deleted files
        if [[ $(git status --porcelain | grep "^ D") ]]; then
            icons="${icons}✗"
        fi
        
        # Staged files
        if [[ $(git status --porcelain | grep "^[AM]") ]]; then
            icons="${icons}●"
        fi
        
        # Stashed changes
        if [[ $(git stash list) ]]; then
            icons="${icons}⚑"
        fi
        
        echo " \[\033[1;33m\][\[\033[1;32m\] $branch\[\033[1;31m\]$icons\[\033[1;33m\]]\[\033[0m\]"
    fi
}

PS1='\[\033[1;36m\]\u\[\033[1;35m\]@\[\033[1;36m\]\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[0m\]$(parse_git_fancy)\[\033[1;35m\]\$\[\033[00m\] '
EOF
    
    echo "✅ Fancy Git prompt installed!"
}

function git_status_legend() {
    echo "📖 Git Status Icons Legend:"
    echo ""
    echo "Branch indicators:"
    echo "  * = Uncommitted changes"
    echo "  ↑ = Ahead of remote"
    echo "  ↓ = Behind remote"
    echo "  ⇕ = Diverged from remote"
    echo ""
    echo "File status icons:"
    echo "  ✎ = Modified files"
    echo "  + = Untracked files"
    echo "  ✗ = Deleted files"
    echo "  ● = Staged files"
    echo "  ⚑ = Stashed changes"
}

function test_git_prompt() {
    echo "🧪 Testing Git prompt in current directory..."
    
    if git rev-parse --git-dir &> /dev/null; then
        branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
        status=$(git status --porcelain)
        
        echo "Current branch: $branch"
        echo ""
        
        if [ -z "$status" ]; then
            echo "✅ Working directory clean"
        else
            echo "📋 Git status:"
            git status --short
        fi
    else
        echo "❌ Not a git repository"
        echo "Initialize with: git init"
    fi
}

function powerline_git() {
    echo "⚡ Installing Powerline-style Git prompt..."
    
    cat > ~/.bashrc_git_powerline << 'EOF'
# Powerline-style Git prompt
parse_git_powerline() {
    if git rev-parse --git-dir &> /dev/null; then
        branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
        
        # Check status
        if [[ $(git status --porcelain) ]]; then
            color="\[\033[48;5;202m\033[38;5;15m\]"  # Orange background
        else
            color="\[\033[48;5;22m\033[38;5;15m\]"   # Green background
        fi
        
        echo "${color}  ${branch} \[\033[0m\]\[\033[38;5;202m\]\[\033[0m\]"
    fi
}

PS1='\[\033[48;5;33m\033[38;5;15m\] \u@\h \[\033[48;5;240m\033[38;5;33m\]\[\033[38;5;15m\] \w \[\033[0m\]\[\033[38;5;240m\]$(parse_git_powerline)\[\033[0m\] '
EOF
    
    echo "✅ Powerline Git prompt installed!"
}

# Menu
echo "🔀 Git Status in Prompt"
echo "1) 📦 Install Basic Git Prompt"
echo "2) 🎨 Install Fancy Git Prompt"
echo "3) ⚡ Install Powerline Git Prompt"
echo "4) 📖 Git Icons Legend"
echo "5) 🧪 Test Git Status Here"
echo -e "\nChoose option (1-5): "
read choice

case $choice in
    1) install_git_prompt ;;
    2) install_fancy_git ;;
    3) powerline_git ;;
    4) git_status_legend ;;
    5) test_git_prompt ;;
    *) echo "Invalid choice!" ;;
esac