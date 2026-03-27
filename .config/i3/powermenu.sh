#!/usr/bin/env bash

# Options to display
lock="󰌾 Lock"
logout="󰍃 Logout"
suspend="󰒲 Suspend"
reboot="󰜉 Reboot"
shutdown=" Shutdown"
hibernate="Hibernate"

# Variable passed to rofi
options="$lock\n$logout\n$suspend\n$reboot\n$shutdown\n$hibernate"

# Launch Rofi with your Dracula config
chosen="$(echo -e "$options" | rofi -dmenu \
    -i \
    -p "System" \
    -config "~/.config/rofi/config.rasi" \
    -hover-select \
    -me-select-entry '' \
    -me-accept-entry MousePrimary)"

# Execution Logic
case $chosen in
    $lock)
        i3lock-fancy || i3lock ;;
    $logout)
        i3-msg exit ;;
    $suspend)
        systemctl suspend ;;
    $reboot)
        systemctl reboot ;;
    $shutdown)
        systemctl poweroff ;;
    $hibernate)
        systemctl hibernate ;;
esac
