#!/usr/bin/env bash

if ! command -v pacman >/dev/null 2>&1; then
  printf "pacman not found. It seems the system is not Arch Linux or an Arch-based distro. Aborting..."
  exit 1
fi

if ! command -v paru >/dev/null 2>&1; then
  sudo pacman -S --needed base-devel
  git clone https://aur.archlinux.org/paru.git /tmp/build-paru
  cd /tmp/build-paru
  makepkg -si
  rm -rf /tmp/build-paru
fi

paru -S --needed $(cat packages.txt | grep -v '^$')
