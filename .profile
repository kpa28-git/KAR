#!/bin/sh
#                        _____ __
#      ____  _________  / __(_) /__
#     / __ \/ ___/ __ \/ /_/ / / _ \
#    / /_/ / /  / /_/ / __/ / /  __/
#   / .___/_/   \____/_/ /_/_/\___/
#  /_/
# Login shell profile config file.

# Add `~/.local/bin/` and all subdirectories to $PATH
BLACKLIST='/.git' 	# Add more items to blacklist with <item1>\|<item2>\|<item3>...
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | grep -v "$BLACKLIST" | tr '\n' ':' | sed 's/:*$//')"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="qutebrowser"
export READER="zathura"
export FILE="ranger"
export PAGER="less"
#export FILE="nnn -d"
export BIB="$HOME/Documents/LaTeX/uni.bib"
#export REFER="$HOME/.referbib"
#export SUDO_ASKPASS="$HOME/.local/bin/tools/dmenupass"
#export PIX="$HOME/.pix/"

# nnn file manager
export NNN_CONTEXT_COLORS='6464'
export NNN_USE_EDITOR=1

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

[ ! -f "$HOME/.config/shortcutrc" ] && shortcuts >/dev/null 2>&1

echo "$0" | grep "bash$" >/dev/null && [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Switch escape and caps if tty:
sudo -n loadkeys "$HOME/.local/bin/ttymaps.kmap" 2>/dev/null

