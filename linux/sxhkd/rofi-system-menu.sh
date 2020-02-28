#!/bin/bash

confirm() {
    echo -e "Yes\nNo" | rofi -dmenu -i -format d -selected-row 1 -p "${1:-Confirm: }"
}

lock="Lock screen"
quit="Logout"
suspend="Suspend"
reboot="Reboot"
shutdown="Shutdown"


content="$lock\n$quit\n$suspend\n$reboot\n$shutdown"

selection=$(echo -e $content | rofi -dmenu -i -markup-rows -p "Action: ")
case $selection in
    $lock)
        # i3lock-fancy -n ;;
        ~/.config/bspwm/lock.sh ;;
    $quit)
        [[ $(confirm) = 1 ]] && (bspc quit) ;;
    $suspend)
        [[ $(confirm) = 1 ]] && (systemctl suspend -i) ;;
    $reboot)
        [[ $(confirm) = 1 ]] && (systemctl reboot -i) ;;
    $shutdown)
        [[ $(confirm) = 1 ]] && (systemctl poweroff -i) ;;
esac
