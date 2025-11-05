#!/bin/bash
# Camera device; adjust if yours is different (default is /dev/video0)
CAMERA_DEV="/dev/video0"
LED_DEV="asus::camera"  # Change if your LED device is named differently

# Function to check if camera is enabled
is_camera_enabled() {
    [ -c "$CAMERA_DEV" ] && [ -r "$CAMERA_DEV" ] && [ -w "$CAMERA_DEV" ]
}

# Toggle camera
if is_camera_enabled; then
    # Disable (restrict) camera: remove permissions for everyone
    sudo chmod 000 "$CAMERA_DEV"
    brightnessctl -d "$LED_DEV" set 1   # Turn LED ON (camera off)
    notify-send "Camera" "Disabled"
else
    # Enable camera: restore permissions for user and group
    sudo chmod 660 "$CAMERA_DEV"
    brightnessctl -d "$LED_DEV" set 0   # Turn LED OFF (camera on)
    notify-send "Camera" "Enabled"
fi
