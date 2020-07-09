#!/bin/bash
#      __               __
#     / /_  ____ ______/ /_
#    / __ \/ __ `/ ___/ __ \
#   / /_/ / /_/ (__  ) / / /
#  /_.___/\__,_/____/_/ /_/
# bash runtime config file.

stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd # Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
export PATH="$HOME/.julia/conda/3/bin:$JAVA_HOME:$PATH"
source "$HOME/.config/broot/launcher/bash/br"


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


