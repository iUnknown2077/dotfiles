#!/usr/bin/env bash


declare -a options=(
  "  Lock"
  "󰩈  Exit"
  "  Reboot"
  "  Shutdown"
  "󰜺  Quit"
)


choice=$(printf '%s\n' "${options[@]}" | fzf --reverse)

case $choice in
  "  Lock")
    slock
  ;;
  "󰩈  Exit")
    pkill Xorg
  ;;
  "  Reboot")
    systemctl reboot
  ;;
  "  Shutdown")
    shutdown -h now
  ;;
  "󰜺  Quit")
    echo "No option selected"
  ;;
esac
