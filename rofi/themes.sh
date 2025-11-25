#!/usr/bin/env bash


dunst="$HOME/.config/dunst/"
fastfetch="$HOME/.config/fastfetch/"
kitty="$HOME/.config/kitty/"
nvim="$HOME/.config/nvim/lua/plugins/"
oxwm="$HOME/.config/oxwm/"
rofi="$HOME/.config/rofi/"
starship="$HOME/.config/starship"

dunst_themes="$HOME/.config/dunst/themes"
fastfetch_themes="$HOME/.config/fastfetch/themes"
kitty_themes="$HOME/.config/kitty/themes"
nvim_themes="$HOME/.config/nvim/lua/plugins/themes"
oxwm_themes="$HOME/.config/oxwm/themes"
rofi_themes="$HOME/.config/rofi/themes"
starship_themes="$HOME/.config/starship/themes"


declare -a options=(
  "gruvbox"
  "tokyonight"
  "quit"
  )


choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 6 -p 'Themes')


if [ "$choice" = 'quit' ]; then
    echo "No theme selected"
    exit
fi


cp "$dunst_themes/$choice" "$dunst/dunstrc"
cp "$fastfetch_themes/$choice.jsonc" "$fastfetch/config.jsonc"
cp "$kitty_themes/$choice.conf" "$kitty/current_theme.conf"
cp "$nvim_themes/$choice.lua" "$nvim/colors.lua"
cp "$oxwm_themes/$choice.lua" "$oxwm/colors.lua"
cp "$rofi_themes/$choice.rasi" "$rofi/config.rasi"
cp "$starship_themes/$choice.toml" "$starship/starship.toml"
