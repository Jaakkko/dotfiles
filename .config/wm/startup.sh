#!/bin/bash

# Wallpaper
feh --bg-scale ~/.config/wall.jpg

# Keyboard layout
setxkbmap -layout fi

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
