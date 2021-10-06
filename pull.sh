#!/bin/bash
cp ~/.vimrc vimrc
cp ~/.zshrc .
cp ~/.imwheelrc .
cp ~/.Xresources .
cp ~/.config/alacritty/alacritty.yml .config/alacritty
cp ~/.config/i3/config .config/i3
cp ~/.config/i3/i3blocks.conf .config/i3
cp ~/.config/rofi/config.rasi .config/rofi
cp ~/.config/wm/startup.sh .config/wm/startup.sh
cp ~/.config/nvim/init.vim .config/nvim/init.vim

# bspwm
cp ~/.config/sxhkd/sxhkdrc .config/sxhkd/sxhkdrc
cp ~/.config/bspwm/bspwmrc .config/bspwm/bspwmrc

# GTK
cp -r ~/.config/gtk-3.0 .config
cp ~/.gtkrc-2.0 .

cp -r ~/.scripts .
