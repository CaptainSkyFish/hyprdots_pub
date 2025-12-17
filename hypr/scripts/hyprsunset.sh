#!/bin/bash

ICON_DIR="$HOME/.config/swaync/icons"

if pgrep -x hyprsunset > /dev/null; then
  if pkill -x hyprsunset; then
    notify-send -a "Hyprsunset" -i "$ICON_DIR/night-light-slash.svg" \
      "Hyprsunset" "Disabled blue light filter"
  else
    notify-send -a "Hyprsunset" \
      "Hyprsunset" "Failed to stop hyprsunset!"
  fi
else
  if nohup hyprsunset > /dev/null 2>&1 & then
    disown
    notify-send -a "Hyprsunset" -i "$ICON_DIR/night-light.svg" \
      "Hyprsunset" "Enabled blue light filter"
  else
    notify-send -a "Hyprsunset" \
      "Hyprsunset" "Failed to start hyprsunset!"
  fi
fi

