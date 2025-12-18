#!/bin/bash

ICON_DIR="$HOME/.config/swaync/icons/picture.png"
dir=~/Pictures/Screenshots
latest_screenshot=$(ls -t "$dir"/*.png 2>/dev/null | head -n1)

if [[ -n "$latest_screenshot" ]]; then
    text=$(tesseract "$latest_screenshot" - 2>/dev/null)
    
    if [[ -n "$text" ]]; then
        echo "$text" | wl-copy
        notify-send -a "tesseract-ocr" -i "$latest_screenshot" "OCR Complete" "Text copied to clipboard"
    else
        notify-send -u critical -a "tesseract-ocr" -i "$ICON_DIR" "OCR Failed" "No text detected"
    fi
else
    notify-send -u critical -a "tesseract-ocr" -i "$ICON_DIR" "OCR Failed" "Screenshot not found"
fi
