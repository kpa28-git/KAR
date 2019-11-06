#!/bin/bash
#      __               __
#     / /_  ____ ______/ /_
#    / __ \/ __ `/ ___/ __ \
#   / /_/ / /_/ (__  ) / / /
#  /_.___/\__,_/____/_/ /_/
# bash runtime config file.

stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

export PATH="$HOME/.vim/bundle/vim-live-latex-preview/bin:$PATH" 	# kev, add vim-live-latex-preview bin
export PATH="$JAVA_HOME:$PATH"	# kev, add JAVA_HOME to the PATH (make sure JAVA_HOME is set to a path first in /etc/profile/)

#echo 'adding aliases to ignore binutils upgrade from 2.30-5';
#pacman() { if [[ "${1:0:2}" == "-S" ]] ; then command pacman "$1" --ignore=binutils "${@:2}"; else command pacman "$@"; fi; }
#yay() { if [[ "${1:0:2}" == "-S" ]] ; then command yay "$1" --ignore=binutils "${@:2}"; else command yay "$@"; fi; }
# downgrade: sudo pacman -U https://archive.archlinux.org/packages/b/binutils/binutils-2.30-5-x86_64.pkg.tar.xz

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kev/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kev/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kev/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kev/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda deactivate;
# <<< conda initialize <<<

