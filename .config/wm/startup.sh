#!/bin/bash

# Wallpaper
feh --bg-scale ~/.config/wall.jpg

# Keyboard layout
setxkbmap -layout fi

# Composite manager
pgrep picom ||
picom --backend glx --shadow-radius=0 --shadow-opacity=0 --use-damage --fade-delta 6 --fade-in-step=0.03 --fade-out-step=0.03 &

# Scroll
pgrep imwheel || imwheel -b 45
