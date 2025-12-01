#!/usr/bin/env bash

FIREFOX="$(command -v firefox || true)"

mapfile -t url  < "$HOME/.config/bookmarks.txt"

choice=$(printf '%s\n' "${url[@]}" | rofi -dmenu -i -l 6 )

if [ "$choice" ]; then
  $FIREFOX "$choice" 2>/dev/null
fi
