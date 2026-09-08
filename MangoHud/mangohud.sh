#!/usr/bin/env bash

set -euo pipefail

declare -A FILES=(
  ["Horizontal"]="$HOME/dotfiles/MangoHud/presets/MangoHud_Horizontal.conf"
  ["Vertical"]="$HOME/dotfiles/MangoHud/presets/MangoHud_Vertical.conf"
)

DEST="$HOME/.config/MangoHud/MangoHud.conf"

command -v fzf >/dev/null || {
  echo "fzf not found." >&2
  exit 1
}

SRC_KEY=$(printf '%s\n' "${!FILES[@]}" | fzf --prompt="Choose file > ")

[[ -z "${SRC_KEY:-}" ]] && {
  echo "No file selected."
  exit 1
}

SRC="${FILES[$SRC_KEY]}"

if [[ ! -f "$SRC" ]]; then
  echo "Error: file $SRC does not exist!" >&2
  exit 1
fi

mkdir -p "$(dirname "$DEST")"
cp "$SRC" "$DEST"

echo "MangoHud config applied"
