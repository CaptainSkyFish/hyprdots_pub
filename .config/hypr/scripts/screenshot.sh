#!/bin/zsh

ICON_DIR="$HOME/.config/swaync/icons"

dir=~/Pictures/Screenshots
mkdir -p "$dir"
file="$dir/$(date +'%Y-%m-%d_%H-%M-%S').png"
grim -g "$(slurp)" "$file" && wl-copy < "$file" && notify-send -i "$ICON_DIR/picture.png" "Screenshot copied to clipboard" "$file"
# hyprshot -m region
