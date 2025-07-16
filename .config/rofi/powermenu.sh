CHOSEN=$(printf " 󰜺  Cancel\n   Lock\n   Reboot\n   Shutdown" | rofi -dmenu -i -theme-str '@import "powermenu.rasi"')

case "$CHOSEN" in
  " 󰜺  Cancel") exit;;
  "   Lock") hyprlock;;
  "   Reboot") systemctl reboot ;;
  "   Shutdown") systemctl poweroff;;
  *) exit 1 ;;
esac
