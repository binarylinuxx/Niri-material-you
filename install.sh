#!/bin/bash

echo "Hello and welcome to Niri-Material-You Dotfiles"
echo "WARNING: this script is currently in a pre-pre-alpha version and probably still has many things to change, add, and fix"

# BACKUP
TO_BACKUP="$HOME/.local $HOME/.config $HOME/.bashrc"
BACKUP_DIR="$HOME/.backup"

# DO_BACKUP
echo "> Starting backup...."
mkdir -p "$BACKUP_DIR"
for item in $TO_BACKUP; do
    cp -r "$item" "$BACKUP_DIR"
done
sleep 2
echo "Done [###>      ] 25%"

# INSTALL PACKAGES
echo "> Installing dependencies..."
PKGS="curl wget niri swaybg eww rofi pamixer jq fish-shell alacritty swayimg nerd-fonts papirus-icon-theme"
sudo xbps-install -Sy $PKGS
echo "Done [####>     ] 45%"

# THEMES/FONTS
FONTS_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONTS_DIR"

FONT_ZIP="JetBrainsMono-2.304.zip"
FONT_URL="https://download.jetbrains.com/fonts/$FONT_ZIP"

echo "> Downloading JetBrains Mono font..."
wget -q "$FONT_URL" -O "$FONT_ZIP"

if [ -f "$FONT_ZIP" ]; then
    unzip -q "$FONT_ZIP" -d JetBrainsMono
    cp -r JetBrainsMono/fonts/ttf/* "$FONTS_DIR"
    rm -rf JetBrainsMono "$FONT_ZIP"
    echo "Done [######>   ] 55%"
else
    echo "Failed to download JetBrains Mono"
fi

# COPY CONFIGS
TO_COPY="$HOME/Niri-material-you/.config"
echo "> Copying configuration files..."
cp -r "$TO_COPY" "$HOME/"
echo "Done [#########] 100%"

echo "Installation completed!"

