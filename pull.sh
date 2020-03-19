#!/bin/bash
cp ~/.vimrc vimrc
cp ~/.zshrc .
cp ~/.zshenv .
cp ~/.imwheelrc .
cp ~/.Xresources .
cp ~/.config/alacritty/alacritty.yml .config/alacritty
cp ~/.config/i3/config .config/i3
cp ~/.config/i3/i3blocks.conf .config/i3
cp ~/.config/rofi/config.rasi .config/rofi

# GTK
cp -r ~/.config/gtk-3.0 .config
cp ~/.gtkrc-2.0 .

cp -r ~/.scripts .
