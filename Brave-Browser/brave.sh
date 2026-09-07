#!/usr/bin/env bash

set -euo pipefail

SRC="$HOME/dotfiles/Brave-Browser/brave-policies.json"
DEST="/etc/brave/policies/managed/"

if [[ ! -f "$SRC" ]]; then
  echo "Error: file $SRC does not exist!" >&2
  exit 1
fi

sudo mkdir -p "$DEST"
sudo cp "$SRC" "$DEST"

echo "Brave policies copied successfully."
