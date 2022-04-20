#!/bin/bash

# Wallpaper
# feh --bg-scale ~/Kuvat/Wallpaper.jpg
feh --bg-fill ~/Pictures/IMG_20210828_104753.jpg

# Keyboard layout
setxkbmap fi nodeadkeys

# Composite manager
pgrep picom ||
picom \
	--backend xrender \
	--inactive-opacity=1.0 \
	--shadow-radius=0 \
	--shadow-opacity=0 \
	--fade-delta 6 \
	--fade-in-step=0.03 \
	--fade-out-step=0.03 \
	--frame-opacity=1.0 &

# Scroll
pgrep imwheel || imwheel -b 45

deadd-notification-center &
