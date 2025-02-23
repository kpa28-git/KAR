#!/bin/sh

"${XDG_CONFIG_HOME:=$HOME/.config}"
DEST="$XDG_CONFIG_HOME/alacritty/alacritty"
ln -sf $DEST"_light.toml" $DEST".toml" 
