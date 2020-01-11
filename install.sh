#!/bin/bash

pacman -S bicom feh i3-gaps i3blocks

# .config
mkdir -p ~/.config/{alacritty,i3}
cp alacritty.yml ~/.config/alacritty
cp config ~/.config/i3
cp wall.jpg ~/.config

# /etc
cp i3blocks.conf /etc
cp vconsole.conf /etc

# ~
cp vimrc ~/.vimrc
cp .bashrc .scripts .xbindkeysrc .xinitrc .Xresources ~
