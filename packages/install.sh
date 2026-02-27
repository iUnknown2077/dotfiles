#!/usr/bin/env bash

set -euo pipefail

if ! command -v pacman >/dev/null 2>&1; then
  printf "pacman not found. It seems the system is not Arch Linux or an Arch-based distro. Aborting..."
  exit 1
fi

if ! command -v paru >/dev/null 2>&1; then

  if ! command -v git >/dev/null 2>&1; then
    sudo pacman -S --needed git
  fi

  sudo pacman -S --needed base-devel rustup
  rustup default stable

  BUILD_DIR=$(mktemp -d /tmp/build-paru.XXXXXX)
  git clone https://aur.archlinux.org/paru.git "$BUILD_DIR"
  cd "$BUILD_DIR"
  makepkg -si --noconfirm
  cd -
  rm -rf $BUILD_DIR

  if ! command -v paru >/dev/null 2>&1; then
    echo "Failed to install paru. Aborting..."
    exit 1
  fi
fi

if [ -f "packages.txt" ]; then
  paru -S --needed $(grep -v '^\s*$\|^\s*\#' packages.txt)
else
  echo "packages.txt not found. Skipping package installation."
fi

xdg-user-dirs-update
