#!/bin/bash

pamixer --default-source -t
ICON_DIR="$HOME/.config/swaync/icons"
# sleep 0.1

if pamixer --default-source --get-mute | grep -q "true"; then
    brightnessctl -d platform::micmute set 1
    notify-send -a "Audio" -i "$ICON_DIR/microphone-mute.png" "Microphone" "Disabled"
else
    brightnessctl -d platform::micmute set 0
    volume=$(pamixer --default-source --get-volume)
    notify-send -a "Audio" -i "$ICON_DIR/microphone.png" "Microphone" "Enabled ${volume}%"
fi
