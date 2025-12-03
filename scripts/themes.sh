#!/usr/bin/env bash

dunst="$HOME/.config/dunst/"
kitty="$HOME/.config/kitty/"
nvim="$HOME/.config/nvim/lua/plugins/"
oxwm="$HOME/.config/oxwm/"
rofi="$HOME/.config/rofi/"

declare -A themes=(
  ["catppuccin-mocha"]="$HOME/.config/themes/catppuccin-mocha"
  ["decay-green"]="$HOME/.config/themes/decay-green"
  ["edge-runner"]="$HOME/.config/themes/edge-runner"
  )

declare -A targets=(
  ["dunstrc"]="$dunst/dunstrc"
  ["kitty.conf"]="$kitty/current-theme.conf"
  ["nvim.lua"]="$nvim/colors.lua"
  ["oxwm.lua"]="$oxwm/colors.lua"
  ["rofi.rasi"]="$rofi/colors.rasi"
  )

declare -a options=(
  "catppuccin-mocha"
  "decay-green"
  "edge-runner"
  )


choice=$(printf '%s\n' "${options[@]}" | fzf --reverse)

theme_dir="${themes[$choice]}"

if [ "$choice" = "quit" ]; then
    echo "No theme selected"
    exit
fi

$HOME/.config/scripts/random-wallpaper.sh

for file in "${!targets[@]}"; do
  src="$theme_dir/$file"
  dst="${targets[$file]}"
  if [[ -f "$src" ]]; then
    cp "$src" "$dst"
  else
    echo "File $src not found"
  fi
done

killall dunst && dunst &
kitty @ load-config
notify-send "$choice"
