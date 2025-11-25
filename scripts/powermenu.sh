#!/usr/bin/env bash


declare -a options=(
  "   Shutdown"
  "   Reboot"
  "   Lock"
  "󰜺   Quit"
  )


choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 6 -p 'PowerMenu')


if [ "$choice" = "   Shutdown"  ]; then
  shutdown -h now
fi

if [ "$choice" = "   Reboot" ]; then
  systemctl reboot
fi

if [ "$choice" = "   Lock" ]; then
  slock
fi

if [ "$choice" = "󰜺   Quit" ]; then
  exit
fi
