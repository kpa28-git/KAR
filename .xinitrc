#!/bin/sh
#           _       _ __
#     _  __(_)___  (_) /_
#    | |/_/ / __ \/ / __/
#   _>  </ / / / / / /_
#  /_/|_/_/_/ /_/_/\__/
# Xorg runtime config file.

displayset &							# Set the display/background
sxhkd &								# Bind hotkeys
setxkbmap -option caps:super -option altwin:menu_win && \	# Map caps to mod, menu button to win, details: /usr/share/X11/xkb/rules/evdev.lst
	killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' & # Mod by itself is now escape, TODO: do the same for right window button
xset r rate 300 50 &						# Increase xrate, speeds up key input
unclutter &							# Remove mouse when idle
picom --config "$XDG_CONFIG_HOME/picom/picom.conf" &		# picom for transparency and to reduce tearing
dunst &								# dunst for notifications
redshift -l "$("$XDG_SCRIPT_HOME/apitools/geoloc" | tr ',' ':')" &
exec "$XDG_CONFIG_HOME/polybar/launch.sh" &
exec bspwm -c "$XDG_CONFIG_HOME/bspwm/bspwmrc"
