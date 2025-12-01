#!/usr/bin/env bash

declare -a options=(
  "Bash"
  "Zsh"
  "Fish"
  "Quit"
  )


choice=$(printf '%s\n' "${options[@]}" | fzf --reverse)

if [ "$choice" = "Bash" ]; then
  chsh -s /bin/bash
fi

if [ "$choice" = "Zsh" ]; then
  chsh -s /bin/zsh
fi

if [ "$choice" = "Fish" ]; then
  chsh -s /bin/fish
fi

if [ "$choice" = "Quit" ]; then
  echo "No shell selected"
fi
