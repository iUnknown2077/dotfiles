# Setup Timers
_sleep1="0.1"
_sleep2="0.5"
_sleep3="2"
_sleep4="1"

sleep $_sleep4

# Kill all XDG
killall -e xdg-desktop-portal-hyprland
killall -e xdg-desktop-portal-gtk
killall xdg-desktop-portal

# Set env variables
exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

# Stop all services
systemctl --user stop pipewire
systemctl --user stop wireplumber
systemctl --user stop xdg-desktop-portal
systemctl --user stop xdg-desktop-portal-gnome
systemctl --user stop xdg-desktop-portal-hyprland
sleep $_sleep1

# Start XDG
/usr/lib/xdg-desktop-portal-hyprland &
sleep $_sleep3
/usr/lib/xdg-desktop-portal-gtk &
sleep $_sleep1
/usr/lib/xdg-desktop-portal &
sleep $_sleep2

# Start services
systemctl --user start pipewire
systemctl --user start wireplumber
systemctl --user start xdg-desktop-portal
systemctl --user start xdg-desktop-portal-hyprland

# Run waybar
sleep $_sleep3
~/.config/hypr/scripts/waybar.sh
