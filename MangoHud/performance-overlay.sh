#!/usr/bin/env bash

set -euo pipefail

declare -A FILES=(
  ["FPS only"]="$HOME/dotfiles/MangoHud/presets/MangoHud-1.conf"
  ["Horizontal"]="$HOME/dotfiles/MangoHud/presets/MangoHud-2.conf"
  ["Extended"]="$HOME/dotfiles/MangoHud/presets/MangoHud-3.conf"
  ["Detailed"]="$HOME/dotfiles/MangoHud/presets/MangoHud-4.conf"
)

ORDER=("FPS only" "Horizontal" "Extended" "Detailed")

DEST="$HOME/.config/MangoHud/MangoHud.conf"

command -v fzf >/dev/null || {
  echo "fzf not found." >&2
  exit 1
}

SRC_KEY=$(printf '%s\n' "${ORDER[@]}" | fzf --prompt="Choose file > ") || {
  echo "No file selected."
  exit 1
}

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
