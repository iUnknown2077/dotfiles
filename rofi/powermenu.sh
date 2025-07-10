CHOSEN=$(printf " 󰜺 Cancel\n  Reboot\n  Shutdown" | rofi -dmenu -i -theme-str '@import "powermenu.rasi"')

case "$CHOSEN" in
  "Cancel") exit;;
  "Reboot") systemctl reboot ;;
  "Shutdown")  systemctl poweroff;;
  *) exit 1 ;;
esac
