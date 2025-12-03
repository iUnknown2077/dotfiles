#!/usr/bin/env bash

dunst="$HOME/.config/dunst/"
kitty="$HOME/.config/kitty/"
oxwm="$HOME/.config/oxwm/"
rofi="$HOME/.config/rofi/"

declare -A themes=(
  ["catppuccin-mocha"]="$HOME/.config/themes/catppuccin-mocha"
  ["decay-green"]="$HOME/.config/themes/decay-green"
  ["edge-runner"]="$HOME/.config/themes/edge-runner"
  ["graphite-mono"]="$HOME/.config/themes/graphite-mono"
  ["gruvbox-retro"]="$HOME/.config/themes/gruvbox-retro"
  ["nordic-blue"]="$HOME/.config/themes/nordic-blue"
  ["rose-pine"]="$HOME/.config/themes/rose-pine"
  ["synth-wave"]="$HOME/.config/themes/synth-wave"
  ["tokyo-night"]="$HOME/.config/themes/tokyo-night"
  )

declare -A targets=(
  ["dunstrc"]="$dunst/dunstrc"
  ["kitty.conf"]="$kitty/current-theme.conf"
  ["oxwm.lua"]="$oxwm/colors.lua"
  ["rofi.rasi"]="$rofi/colors.rasi"
  )

declare -a options=(
  "catppuccin-mocha"
  "decay-green"
  "edge-runner"
  "graphite-mono"
  "gruvbox-retro"
  "nordic-blue"
  "rose-pine"
  "synth-wave"
  "tokyo-night"
  "quit"
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
