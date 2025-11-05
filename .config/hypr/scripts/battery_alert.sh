#!/bin/zsh
ICON_DIR="$HOME/.config/swaync/icons"
low_level=20
critical_level=10
full=100
bat="/sys/class/power_supply/BAT0"
last_status=""

# loop 1
while true; do
  capacity=$(<"$bat/capacity")
  bat_status=$(<"$bat/status")

  if [[ "$bat_status" != "$last_status" ]]; then
    if [[ "$bat_status" == "Charging" ]]; then
      notify-send -i "$ICON_DIR/charging.png" "Plugged In" "Charging...${capacity}%"
    elif [[ "$bat_status" == "Discharging" ]]; then
      notify-send -i "$ICON_DIR/plug.png" "Plugged Out" "Running on battery"
    fi
    last_status="$bat_status"
  fi
  sleep 1
done &   # run in background

# loop 2
while true; do
  capacity=$(<"$bat/capacity")
  bat_status=$(<"$bat/status")

  if [[ "$bat_status" == "Discharging" ]]; then
    if (( capacity <= critical_level )); then
      brightnessctl set 20%
      notify-send -i "$ICON_DIR/battery-critical.png" --urgency=critical "!! Battery Critical !!" "${capacity}% left!"
    elif (( capacity <= low_level )); then
      brightnessctl set 40%
      notify-send -i "$ICON_DIR/battery-low.png" --urgency=critical "Battery Low!" "${capacity}% left!"
    fi
  elif [[ "$bat_status" == "Charging" && "$capacity" -eq "$full" ]]; then
    notify-send -i "$ICON_DIR/battery-full.png" "Battery Full" "${capacity}% charged"
  fi
  sleep 120
done

