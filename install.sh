#!/bin/bash

echo"hello and welcome to Niri-Material-You Dotfiles"
echo"WARNING: this script currently pre-pre-alpha! version and probably still left many things to change,add and fix"

#BACKUP
TO_BACKUP="~/.local ~/.config ~/.bashrc"
BACKUP_DIR="~/.backup"

#DO_BACKUP
echo"> Starting backup...."
mkdir -p $BACKUP_DIR
cp -r $TO_BACKUP $BACKUP_DIR
sleep 2
echo"done [###>      ] 25%"

#INSTALL_PACKAGES
echo"> Starting install dependencis...."
PKGS="curl wget niri swaybg eww rofi pamixer jq fish-shell alacritty swayimg nerd-font-symbols-ttf papirus-icon-theme"
sudo xbps-install -S $PKGS
echo"done [####>     ] 45%"

#THEMES/FONTS
FONTS_DIR="~/.local/share/fonts/"
mkdir -p $FONTS_DIR
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
unzip JetBrainsMono-2.304.zip
cp -r fonts/ttf/* $FONTS_DIR
echo"done [######>   ] 55%"

#COPY_CONFIGS
TO_COPY="~/Niri-material-you/.config"
cp -r $TO_COPY ~/
