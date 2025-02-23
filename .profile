#!/bin/sh
#                        _____ __
#      ____  _________  / __(_) /__
#     / __ \/ ___/ __ \/ /_/ / / _ \
#    / /_/ / /  / /_/ / __/ / /  __/
#   / .___/_/   \____/_/ /_/_/\___/
#  /_/
# Posix login shell profile config file.

# XDG standard directories:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_SCRIPT_HOME="$HOME/.local/bin"
export XDG_SRC_HOME="$HOME/.local/src"

# Default programs/settings:
export TERMINFO='/usr/lib/terminfo'
export TERMINAL='alacritty'
export OPENER='xdg-open'
export VISUAL='helix'
export EDITOR=$VISUAL
export DIFFPROG=$VISUAL
export PAGER='bat'
export BROWSER='firefox'
export READER='zathura'
export FILE='yazi'
export CALCULATOR='julia'
export TASK_CLIENT='planify'
export EMAIL_CLIENT='tutanota-desktop'
export MUSIC_CLIENT='termusic'
export BIB="$HOME/Documents/LaTeX/uni.bib"
export READING="$HOME/Documents/reading"
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
export RUST_TOOLCHAIN="$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu"
export JULIA_CUDA_SOFT_MEMORY_LIMIT="80%"
export EZA_COLORS="sn=35:sb=35:uu=34:uR=31:da=36:di=33:ln=36:lp=3;36:ex=32:fi=37:*.pdf=34:*.png=34:README.md=37"
export MANROFFOPT='-c' # (bat issue #2593): fixes manpage syntax highlighting

# Clean up home:
export LESSHISTFILE="-"
export BDOTDIR="$XDG_CONFIG_HOME/bash"
export INPUTRC="$BDOTDIR/inputrc"
export PSQLRC="$XDG_CONFIG_HOME/postgres/psqlrc"
export ALIASDIR="$XDG_SCRIPT_HOME/aliases"
# export GOPATH="$XDG_SRC_HOME/go"
export PYLINTRC="$XDG_CONFIG_HOME/pylint/pylintrc"
export GRIPHOME="$XDG_CONFIG_HOME/grip"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

# Add `$XDG_SCRIPT_HOME/*`, java, go, julia to $PATH:
BLACKLIST='/.git' 	# Add more items to blacklist with <item1>\|<item2>\|<item3>...
export PATH="$PATH:$(du "$XDG_SCRIPT_HOME" | cut -f2 | grep -v "$BLACKLIST" | tr '\n' ':' | sed 's/:*$//')"
export PATH="$JAVA_HOME:$PATH:$GOPATH/bin:$HOME/.julia/conda/3/bin:$XDG_SRC_HOME/webapp/bin"

# day/night theming with darkman
export DARKMAN_LAT="$(sed 1q $XDG_CONFIG_HOME/loc/default.txt)"
export DARKMAN_LNG="$(sed -n '2{p;q}' $XDG_CONFIG_HOME/loc/default.txt)"
export XDG_DATA_DIRS="$XDG_DATA_DIRS:$XDG_DATA_HOME"

# Switch escape <-> caps for tty
sudo -n loadkeys "$XDG_SCRIPT_HOME/ttymaps.kmap" 2>/dev/null

# load user defaults into systemd env
systemctl --user import-environment TERMINAL VISUAL EDITOR BROWSER FILE CALCULATOR TASK_CLIENT EMAIL_CLIENT MUSIC_CLIENT DARKMAN_LAT DARKMAN_LNG
dbus-update-activation-environment --systemd TERMINAL VISUAL EDITOR BROWSER FILE CALCULATOR TASK_CLIENT EMAIL_CLIENT MUSIC_CLIENT DARKMAN_LAT DARKMAN_LNG

