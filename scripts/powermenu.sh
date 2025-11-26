#!/usr/bin/env bash


declare -a options=(
  "   Lock"
  "󰩈   Exit"
  "   Reboot"
  "   Shutdown"
  "󰜺   Quit"
)


choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 6 -p 'PowerMenu')


if [ "$choice" = "   Lock" ]; then
  slock
fi

if [ "$choice" = "󰩈   Exit" ]; then
  pkill Xorg
fi

if [ "$choice" = "   Reboot" ]; then
  systemctl reboot
fi

if [ "$choice" = "   Shutdown" ]; then
  shutdown -h now
fi

if [ "$choice" = "󰜺   Quit" ]; then
  echo 
fi
