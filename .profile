#!/bin/sh
#                        _____ __
#      ____  _________  / __(_) /__
#     / __ \/ ___/ __ \/ /_/ / / _ \
#    / /_/ / /  / /_/ / __/ / /  __/
#   / .___/_/   \____/_/ /_/_/\___/
#  /_/
# Posix login shell profile config file.
# See $XDG_CONFIG_HOME/environment.d for most of the environment settings

export PATH="$PATH:$HOME/.local/src/go/bin:$HOME/.julia/bin:$HOME/.julia/conda/3/bin"

# Add `$XDG_BIN_HOME/*` to $PATH, exclude git
BIN_DIRS=$(/bin/find "$HOME/.local/bin" -type d ! -path '*/.git' ! -path '*/.git/*' -print | tr '\n' ':')
export PATH="${PATH:+$PATH:}${BIN_DIRS%:}"

# Switch escape <-> caps for tty
sudo -n loadkeys "$XDG_BIN_HOME/ttymaps.kmap" 2>/dev/null

