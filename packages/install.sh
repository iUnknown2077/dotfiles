#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
source $SCRIPT_DIR/pkgs.sh

_IsInstalled() {
  package="$1"
  check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")"
  if [ -n "${check}" ]; then
    echo 0
    return
  fi
  echo 1
  return
}

_InstallPackages() {
  for pkg; do
    if [[ $(_IsInstalled "${pkg}") == 0 ]]; then
      echo ":: ${pkg} is already installed."
      continue
    fi
    paru -S --needed --noconfirm "${pkg}"
  done
}

_InstallPackages "${de[@]}"
_InstallPackages "${audio[@]}"
_InstallPackages "${clip[@]}"
_InstallPackages "${xdg[@]}"
_InstallPackages "${themes[@]}"
_InstallPackages "${fonts[@]}"
_InstallPackages "${wayland[@]}"
_InstallPackages "${other[@]}"

xdg-user-dirs-update
