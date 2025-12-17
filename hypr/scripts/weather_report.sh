#!/bin/bash

check_internet() {
    curl -s --head --request GET https://www.google.com >/dev/null 2>&1
}

if ! check_internet; then
    notify-send -a "Weather" "Weather Report" "No internet connection"
    exit 1
fi

LOCATION=$(curl -s https://ipinfo.io | jq -r '.city') 
if [ -z "$LOCATION" ]; then 
  notify-send -a "Weather" "Weather Report" "ipinfo error"
  exit 1
fi

MOON_PHASE=$(curl -s "wttr.in/$LOCATION?format=%m") 
WEATHER=$(curl -s "wttr.in/$LOCATION?format=%t+%c+%C" | tr -d '+')

notify-send -a "Weather" "$LOCATION $MOON_PHASE" "$WEATHER"

