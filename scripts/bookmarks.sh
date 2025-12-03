#!/usr/bin/env bash

FIREFOX="$(command -v firefox || true)"

mapfile -t bookmarks < "$HOME/.config/bookmarks.txt"

names=()
urls=()
for bookmark in "${bookmarks[@]}"; do
  name="${bookmark%%=*}"
  url="${bookmark#*=}"
  names+=("$name")
  urls+=("$url")
done

choice=$(printf '%s\n' "${names[@]}" | rofi -dmenu -config ~/.config/rofi/bookmarks.rasi -i -l 10 -p Bookmarks)

if [ "$choice" ]; then
  for i in "${!names[@]}"; do
    if [ "${names[$i]}" = "$choice" ]; then
      $FIREFOX "${urls[$i]}" 2>/dev/null
      break
    fi
  done
fi
