#!/bin/sh

DEST="$XDG_CONFIG_HOME/helix/config"
ln -sf $DEST"_light.toml" $DEST".toml" 
