#!/bin/bash

# Variables
packages="./packages.txt"
flatpaks="./flatpaks.txt"
dotfiles_git="https://github.com/iUnknown2077/dotfiles.git"
dotfiles="$HOME/dotfiles/"
config="$HOME/.config/"

echo "Installing native packages"
#paru -S --needed --noconfirm $(<"$packages")

echo "Installing flatpacks"
#flatpak install -y $(<"$flatpaks")

echo "Creating XDG directories"
#xdg-user-dirs-update

cd "$HOME/Pobrane/"
git clone "$dotfiles_git"
mv "dotfiles" "$HOME/"

cd "$dotfiles"
ln -s /home/wiktor/dotfiles/{dunst,fastfetch,kitty,mango,nvim,oxwm,rofi,waybar,xdg-desktop-portal} $config
mkdir /home/wiktor/.config/fish
ln -s /home/wiktor/dotfiles/fish/config.fish /home/wiktor/.config/fish/
