#!/bin/sh
#           _       _ __
#     _  __(_)___  (_) /_
#    | |/_/ / __ \/ / __/
#   _>  </ / / / / / /_
#  /_/|_/_/_/ /_/_/\__/
# Xorg runtime config file.

displayset &		# Set the display/background
sxhkd &	# Bind keys
# Switch to US international with Caps as Mod/Escape
setxkbmap -option caps:super -variant altgr-intl && killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' &
# Properties button extra Mod/Escape
xmodmap -e 'keycode 135 = Super_R' &
xset r rate 300 50 &	# Speed xrate up
unclutter &		# Remove mouse when idle
#picom --config "$HOME/.config/picom/picom.conf" &	# picom for transparency and to reduce tearing
dunst &			# dunst for notifications
redshift -l "$("$HOME/.local/bin/apitools/geoloc" | tr ',' ':')" &
exec "$HOME/.config/polybar/launch.sh" &
exec bspwm -c "$HOME/.config/bspwm/bspwmrc"
