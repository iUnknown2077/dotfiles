#!/usr/bin/env bash

src="$HOME/.config/feh/wallpapers/astronaut"
dst="$HOME/.config/feh/wallpaper.jpg"

file=$(find "$src" -maxdepth 1 -type f -name "*.jpg" | shuf -n 1 )

cp "$file" "$dst"
feh --bg-scale $HOME/.config/feh/wallpaper.jpg*
echo "wallpaper updated"
