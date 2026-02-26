#!/bin/sh
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
LIST="$DOTFILES/configs.txt"

while IFS='|' read -r src dst url; do
  [ -z "$src" ] && continue
  [ -z "$dst" ] && continue

  src="$DOTFILES/$src"
  dst="$HOME/$dst"

  if [ ! -e "$src" ]; then
    echo "SKIP: $src"
    continue
  fi

  [ -L "$dst" ] && rm "$dst"
  [ -e "$dst" ] && mv "$dst" "$dst.bak"

  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "LINK: $dst -> $src"
done <"$LIST"

echo "Done."
