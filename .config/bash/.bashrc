#!/bin/bash
#      __               __
#     / /_  ____ ______/ /_
#    / __ \/ __ `/ ___/ __ \
#   / /_/ / /_/ (__  ) / / /
#  /_.___/\__,_/____/_/ /_/
# bash runtime config file.

# basic shell config:
stty -ixon              # Disable ctrl-s and ctrl-q.
shopt -s autocd         # Allows you to cd into directory by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

# bash prompt config:
PS1_RESET='\[$(tput sgr0)\]'
PS1_BOLD='\[$(tput bold)\]'
PS1_BRKT='\[$(tput setaf 1)\]'
PS1_ATSN='\[$(tput setaf 2)\]'
PS1_USER='\[$(tput setaf 3)\]'
PS1_HOST='\[$(tput setaf 4)\]'
PS1_PATH='\[$(tput setaf 5)\]'
PS1_DRSN='\[$(tput setaf 7)\]'
export PS1="${PS1_BOLD}${PS1_BRKT}[${PS1_USER}\u${PS1_ATSN}@${PS1_HOST}\h ${PS1_PATH}\W${PS1_BRKT}] ${PS1_DRSN}\\$ ${PS1_RESET}"

# load aliases, plugins, syntax highlighting
source "$ALIASDIR/load-aliases.sh"
source '/usr/share/doc/pkgfile/command-not-found.bash'

