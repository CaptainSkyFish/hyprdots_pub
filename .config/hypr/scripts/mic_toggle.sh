#!/bin/bash
# Toggle microphone mute and update the micmute LED accordingly

# Toggle mic mute with pamixer
pamixer --default-source -t
ICON_DIR="$HOME/.config/swaync/icons"
# Short pause to make sure the state is updated
sleep 0.1

# Check mic mute status
if pamixer --default-source --get-mute | grep -q "true"; then
    # Microphone is muted, turn on the LED
    brightnessctl -d platform::micmute set 1
    notify-send -i "$ICON_DIR/microphone-mute.png" "Microphone" "Disabled"
else
    # Microphone is unmuted, turn off the LED
    brightnessctl -d platform::micmute set 0
    notify-send -i "$ICON_DIR/microphone.png" "Microphone" "Enabled"
fi
