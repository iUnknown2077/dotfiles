#!/usr/bin/env bash

alacritty="$HOME/.config/alacritty/"
dunst="$HOME/.config/dunst/"
kitty="$HOME/.config/kitty/"
nvim="$HOME/.config/nvim/lua/plugins/"
oxwm="$HOME/.config/oxwm/"
rofi="$HOME/.config/rofi/"

declare -A themes=(
  ["catppuccin-mocha"]="$HOME/.config/themes/catppuccin-mocha"
  ["dracula"]="$HOME/.config/themes/dracula"
  ["everforest"]="$HOME/.config/themes/everforest"
  ["gruvbox"]="$HOME/.config/themes/gruvbox"
  ["kanagawa"]="$HOME/.config/themes/kanagawa"
  ["material-you"]="$HOME/.config/themes/material-you"
  ["nord"]="$HOME/.config/themes/nord"
  ["osaka-jade"]="$HOME/.config/themes/osaka-jade"
  ["oxocarbon"]="$HOME/.config/themes/oxocarbon"
  ["ristretto"]="$HOME/.config/themes/ristretto"
  ["tokyonight"]="$HOME/.config/themes/tokyonight"
  )

declare -A targets=(
  ["alacritty.toml"]="$alacritty/colors.toml"
  ["dunstrc"]="$dunst/dunstrc"
  ["kitty.conf"]="$kitty/current-theme.conf"
  ["nvim.lua"]="$nvim/colors.lua"
  ["oxwm.lua"]="$oxwm/colors.lua"
  ["rofi.rasi"]="$rofi/colors.rasi"
  )

declare -a options=(
  "catppuccin-mocha"
  "dracula"
  "everforest"
  "gruvbox"
  "kanagawa"
  "material-you"
  "nord"
  "osaka-jade"
  "oxocarbon"
  "ristretto"
  "tokyonight"
  "quit"
  )


choice=$(printf '%s\n' "${options[@]}" | fzf --reverse)

theme_dir="${themes[$choice]}"

if [ "$choice" = "quit" ]; then
    echo "No theme selected"
    exit
fi

$HOME/.config/scripts/random-wallpaper.sh
matugen image "$HOME/.config/feh/wallpaper.jpg"

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
