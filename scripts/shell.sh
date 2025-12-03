#!/usr/bin/env bash

declare -a options=(
  "Bash"
  "Zsh"
  "Fish"
  "Quit"
  )

choice=$(printf '%s\n' "${options[@]}" | fzf --reverse)

case $choice in
  "Bash")
    chsh -s /bin/bash
  ;;
  "Zsh")
    chsh -s /bin/zsh
  ;;
  "Fish")
    chsh -s /bin/fish
  ;;
  "Quit")
    echo "No shell selected"
  ;;
esac
