#!/bin/bash

set +e

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots >/dev/null 2>&1
/usr/lib/xdg-desktop-portal-wlr >/dev/null 2>&1 &
mako >/dev/null 2>&1 &
swaybg -i ~/.config/mango/wallpapers/wall-1.png >/dev/null 2>&1 &
waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css >/dev/null 2>&1 &
wl-clip-persist --clipboard regular --reconnect-tries 0 >/dev/null 2>&1 &
wl-paste --type text --watch cliphist store >/dev/null 2>&1 &
/usr/lib/xfce-polkit/xfce-polkit >/dev/null 2>&1 &
