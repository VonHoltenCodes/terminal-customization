#!/bin/bash

# Weather in Terminal Prompt

function get_weather() {
    # Using wttr.in service
    location="${1:-Austin}"
    weather_data=$(curl -s "wttr.in/${location}?format=%c+%t")
    echo "$weather_data"
}

function install_weather_prompt() {
    echo "🌤️ Installing weather in prompt..."
    
    cat > ~/.bashrc_weather << 'EOF'
# Weather in prompt
get_weather_prompt() {
    if [ -f ~/.weather_cache ]; then
        # Check if cache is older than 30 minutes
        if [ $(($(date +%s) - $(stat -c %Y ~/.weather_cache))) -gt 1800 ]; then
            curl -s "wttr.in?format=%c+%t" > ~/.weather_cache 2>/dev/null
        fi
    else
        curl -s "wttr.in?format=%c+%t" > ~/.weather_cache 2>/dev/null
    fi
    cat ~/.weather_cache 2>/dev/null || echo "☁️"
}

# Add weather to prompt
PS1='$(get_weather_prompt) \[\033[1;36m\]\u\[\033[1;35m\]@\[\033[1;36m\]\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;35m\]\$\[\033[00m\] '
EOF
    
    echo "✅ Weather prompt installed!"
    echo "Add 'source ~/.bashrc_weather' to your .bashrc to enable"
}

function weather_icons() {
    echo "🎨 Weather Icon Meanings:"
    echo "☀️  Clear sky"
    echo "🌤️  Partly cloudy"
    echo "☁️  Cloudy"
    echo "🌧️  Rain"
    echo "⛈️  Thunderstorm"
    echo "🌨️  Snow"
    echo "🌫️  Fog"
    echo "🌪️  Tornado"
}

function live_weather() {
    echo "🌍 Live Weather Display (Press Ctrl+C to stop)"
    read -p "Enter location (default: Austin): " location
    location=${location:-Austin}
    
    while true; do
        clear
        echo "╔═══════════════════════════════════════╗"
        echo "║         WEATHER STATION               ║"
        echo "╠═══════════════════════════════════════╣"
        
        # Get weather data
        weather=$(curl -s "wttr.in/${location}?format=%l:+%c+%t+%h+%w")
        printf "║ %-37s ║\n" "$weather"
        
        # Get more details
        conditions=$(curl -s "wttr.in/${location}?format=%C")
        pressure=$(curl -s "wttr.in/${location}?format=%P")
        moon=$(curl -s "wttr.in/${location}?format=%m")
        
        printf "║ Conditions: %-25s ║\n" "$conditions"
        printf "║ Pressure: %-27s ║\n" "$pressure"
        printf "║ Moon Phase: %-25s ║\n" "$moon"
        
        echo "╚═══════════════════════════════════════╝"
        echo ""
        echo "Updated: $(date '+%H:%M:%S')"
        
        sleep 60
    done
}

function weather_forecast() {
    read -p "Enter location (default: Austin): " location
    location=${location:-Austin}
    curl "wttr.in/${location}"
}

# Menu
echo "🌤️ Weather Terminal Integration"
echo "1) 🌍 Current Weather"
echo "2) 📊 Weather Forecast"
echo "3) 🖥️  Install Weather in Prompt"
echo "4) 🎨 Weather Icon Guide"
echo "5) 📺 Live Weather Display"
echo -e "\nChoose option (1-5): "
read choice

case $choice in
    1) 
        read -p "Enter location: " loc
        echo "Weather: $(get_weather "$loc")"
        ;;
    2) weather_forecast ;;
    3) install_weather_prompt ;;
    4) weather_icons ;;
    5) live_weather ;;
    *) echo "Invalid choice!" ;;
esac