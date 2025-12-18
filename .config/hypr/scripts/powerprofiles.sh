#!/bin/bash

ICON_DIR="$HOME/.config/swaync/icons"

# Get current profile
current=$(powerprofilesctl get)

case "$current" in
  balanced)
    next="performance"
    icon="fire.svg"
    ;;
  performance)
    next="power-saver"
    icon="leaf.svg"
    ;;
  power-saver)
    next="balanced"
    icon="yin-yang.svg"
    ;;
  *)
    next="balanced"
    icon="yin-yang.svg"
    ;;
esac

powerprofilesctl set "$next" && \
  notify-send -i "$ICON_DIR/$icon" -a "powerprofilesctl" "Power profile" "Switched to: $next"
