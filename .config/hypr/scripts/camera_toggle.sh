#!/bin/bash

CAMERA_DEV="/dev/video0"
LED_DEV="asus::camera"
ICON_DIR="$HOME/.config/swaync/icons"

is_camera_enabled() {
    [ -c "$CAMERA_DEV" ] && [ -r "$CAMERA_DEV" ] && [ -w "$CAMERA_DEV" ]
}

if is_camera_enabled; then
    if sudo chmod 000 "$CAMERA_DEV"; then
        brightnessctl -d "$LED_DEV" set 1
        notify-send -a "Camera" -i "$ICON_DIR/camera-slash.svg" "Camera" "Disabled"
    else
        notify-send -a "Camera" "Camera" "Failed to disable (chmod error)"
    fi
else
    if sudo chmod 660 "$CAMERA_DEV"; then
        brightnessctl -d "$LED_DEV" set 0
        notify-send -a "Camera" -i "$ICON_DIR/camera.svg" "Camera" "Enabled"
    else
        notify-send -a "Camera" "Camera" "Failed to enable (chmod error)"
    fi
fi

