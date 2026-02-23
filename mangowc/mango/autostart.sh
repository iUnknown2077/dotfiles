#!/bin/bash

set +e

waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css >/dev/null 2>&1 &
swaybg -i ~/.config/mango/wallpapers/wall-1.png >/dev/null 2>&1 &
/usr/lib/xfce-polkit/xfce-polkit >/dev/null 2>&1 &
