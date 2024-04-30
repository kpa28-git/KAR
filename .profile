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
export TERMINAL='/usr/bin/terminal'
export OPENER='xdg-open'
export VISUAL='helix'
export EDITOR=$VISUAL
export DIFFPROG=$VISUAL
export PAGER='bat'
export BROWSER='qutebrowser'
export READER='zathura'
export FILE='joshuto'
export TASK_CLIENT='planify'
export EMAIL_CLIENT='tutanota-desktop'
export BIB="$HOME/Documents/LaTeX/uni.bib"
export READING="$HOME/Documents/reading"
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
export SUDO_ASKPASS="$XDG_SCRIPT_HOME/uitools/raskpass"
# export MAIL="$HOME/Documents/mail"
export RUST_TOOLCHAIN="$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu"
#export REFER="$HOME/.referbib"
#export PIX="$HOME/.pix/"
export GDK_SCALE=2
export JULIA_CUDA_SOFT_MEMORY_LIMIT="80%"

# Clean up home:
export LESSHISTFILE="-"
export BDOTDIR="$XDG_CONFIG_HOME/bash"
export INPUTRC="$BDOTDIR/inputrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export PSQLRC="$XDG_CONFIG_HOME/postgres/psqlrc"
export ALIASDIR="$XDG_SCRIPT_HOME/aliases"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export GOPATH="$XDG_SRC_HOME/go"
export PYLINTRC="$XDG_CONFIG_HOME/pylint/pylintrc"
export GRIPHOME="$XDG_CONFIG_HOME/grip"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

# Add `$XDG_SCRIPT_HOME/*`, java, go, julia to $PATH:
BLACKLIST='/.git' 	# Add more items to blacklist with <item1>\|<item2>\|<item3>...
export PATH="$PATH:$(du "$XDG_SCRIPT_HOME" | cut -f2 | grep -v "$BLACKLIST" | tr '\n' ':' | sed 's/:*$//')"
export PATH="$JAVA_HOME:$PATH:$GOPATH/bin:$HOME/.julia/conda/3/bin:$XDG_SRC_HOME/webapp/bin"

# Global day/night times for theming:
export TIMENIGHT="17:00"
export TIMEDAY="08:00"

# Set less/man colors:
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

export EZA_COLORS="sn=35:sb=35:uu=34:uR=31:da=36:di=33:ln=36:lp=3;36:ex=32:fi=37:*.pdf=34:*.png=34:README.md=37"

# # This is the list for lf icons:
# export LF_ICONS="di=:fi=:tw=:ow=:ln=:or=:ex=󱐌:\
# *.txt=:*.md=:*.csv=:*.log=:*.1=:*.nfo=:*.info=:\
# *.sh=:*.c=󰙱:*.cpp=󰙲:*.jl=:*.rs=󱘗:*.py=:*.jar=:*.java=:\
# *.json=:*.toml=:*.html=:*.xml=󰗀:*.css=:*.js=:*.tex=:*.bib=:*.ipynb=󰠮:\
# *.out=:*.so=:*.gpg=:\
# *.db=:*.arrow=:*.feather=:*.parquet=:\
# *.part=󰋮:*.torrent=:\
# *.zip=:*.rar=:*.7z=:*.tar.gz=:\
# *.pdf=:*.djvu=:*.epub=:\
# *.doc=󱎒:*.docx=󱎒:*.xlsx=󱎏:*.pptx=󱎐:\
# *.gif=󰤚:*.png=󰣌:*.webp=󰣌:*.ico=󰣌:*.jpg=:*.jpe=:*.jpeg=:*.svg=:\
# *.mp3=:*.opus=:*.ogg=:*.m4a=:*.flac=🎼:*.wav=🎼:\
# *.mkv=:*.mp4=:*.webm=:*.mpeg=:*.avi=:*.mov=:*.mpg=:*.wmv=:*.m4b=:*.flv=:\
# *.iso=󰋊:*.img=󰋊:\
# "

# run the {bash, zsh} shell runtime config
# echo "$0" | grep "bash$" >/dev/null && [ -f "$BDOTDIR/.bashrc" ] && source "$BDOTDIR/.bashrc"
# echo "$0" | grep "zsh$" >/dev/null && [ -f "$ZDOTDIR/.zshrc" ] && source "$ZDOTDIR/.zshrc"

# Start graphical server if bspwm not already running
# [ "$(tty)" = "/dev/tty1" ] && ! pgrep -x bspwm >/dev/null && exec startx

# Switch escape <-> caps for tty
sudo -n loadkeys "$XDG_SCRIPT_HOME/ttymaps.kmap" 2>/dev/null

