#!/bin/bash

ICON_DIR="$HOME/.config/swaync/icons"
LOW_LEVEL=20
CRITICAL_LEVEL=10
FULL=99
BAT="/sys/class/power_supply/BAT0"

last_status=""
low_notified=false
critical_notified=false

get_battery_info() {
    capacity=$(<"$BAT/capacity")
    status=$(<"$BAT/status")
}

handle_battery_change() {
    get_battery_info
    
    if [[ "$status" != "$last_status" ]]; then
        if [[ "$status" == "Charging" ]]; then
            if [[ "$(powerprofilesctl get)" != "balanced" ]]; then
                notify-send -h string:x-canonical-private-synchronous:battery_notif \
                  -a "Battery" -i "$ICON_DIR/charging.png" \
                -A "balanced=Switch to balanced" \
                "Plugged In" "Charging...${capacity}%" & # Run in background to avoid blocking code
            else
                notify-send -h string:x-canonical-private-synchronous:battery_notif \
                  -a "Battery" -i "$ICON_DIR/charging.png" \
                "Plugged In" "Charging...${capacity}%"
            fi
            low_notified=false
            critical_notified=false
            
        elif [[ "$status" == "Discharging" && "$last_status" == "Charging" ]]; then
            notify-send -h string:x-canonical-private-synchronous:plug_notif -a "Battery" -i "$ICON_DIR/plug.png" "Plugged Out" "Running on battery"
        fi
        last_status="$status"
    fi
    
    if [[ "$status" == "Discharging" ]]; then
        if (( capacity <= CRITICAL_LEVEL )) && [[ "$critical_notified" == false ]]; then
            brightnessctl set 10%-
            notify-send -e -h string:x-canonical-private-synchronous:battery_notif \
                -a "Battery" -u critical -i "$ICON_DIR/battery-critical.png" \
                "!! Battery Critical !!" "${capacity}% left!"
            critical_notified=true
            
        elif (( capacity <= LOW_LEVEL )) && [[ "$low_notified" == false ]]; then
            brightnessctl set 5%-
            if [[ "$(powerprofilesctl get)" != "power-saver" ]]; then
                notify-send -e -h string:x-canonical-private-synchronous:battery_notif \
              -A "power-saver=Switch to power-saver" \
              -a "Battery" -u critical -i "$ICON_DIR/battery-low.png" \
              "Battery Low!" "<b>${capacity}%</b> left!" & # Run in background
            else
                notify-send -e -h string:x-canonical-private-synchronous:battery_notif \
                  -a "Battery" -u critical -i "$ICON_DIR/battery-low.png" \
                  "Battery Low!" "<b>${capacity}%</b> left!"
            fi
            low_notified=true
        fi
    fi
    
    if [[ "$status" == "Charging" && "$capacity" -ge "$FULL" ]]; then
        notify-send -i "$ICON_DIR/battery-full.png" "Battery Full" "${capacity}% charged"
    fi
}

# Initial check
handle_battery_change

upower --monitor | while read -r line; do
    if [[ "$line" =~ (device changed|device added|device removed) ]]; then
        handle_battery_change
    fi
done &

# # Fallback: Also listen to ACPI events for plug/unplug detection
# if command -v acpi_listen &> /dev/null; then
#     acpi_listen | while read -r event; do
#         if [[ "$event" =~ (ac_adapter|battery) ]]; then
#             handle_battery_change
#         fi
#     done &
# fi

while true; do
    sleep 30
    handle_battery_change
done

