#!/bin/bash

ICON_DIR="$HOME/.config/swaync/icons/picture.png"

dir=~/Pictures/Screenshots
mkdir -p "$dir"
filename=$(date +'%Y-%m-%d_%H-%M-%S').png
file="$dir/$filename"

if grim -g "$(slurp)" "$file" && wl-copy < "$file"; then
    notify-send -a "grim" -i "$file" \
        -A "ocr=Run OCR" \
        "Screenshot copied to clipboard" "$filename"
fi
# hyprshot -m region
