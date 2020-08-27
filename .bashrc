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

wrapgp() {
	# outputs git prompt wrapped with spaces if not empty,
	# outputs a single space otherwise
	var=" $(gitprompt-rs) " && printf "${var/  / }";
}
PS1_RESET='\[$(tput sgr0)\]'
PS1_BOLD='\[$(tput bold)\]'
PS1_BRKT='\[$(tput setaf 1)\]'
PS1_ATSN='\[$(tput setaf 2)\]'
PS1_USER='\[$(tput setaf 3)\]'
PS1_HOST='\[$(tput setaf 4)\]'
PS1_PATH='\[$(tput setaf 5)\]'
PS1_DRSN='\[$(tput setaf 7)\]'
export PS1="${PS1_BOLD}${PS1_BRKT}[${PS1_USER}\u${PS1_ATSN}@${PS1_HOST}\h ${PS1_PATH}\W${PS1_BRKT}]${PS1_RESET}\$(wrapgp)${PS1_DRSN}\\$ ${PS1_RESET}"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
source '/usr/share/doc/pkgfile/command-not-found.bash'
export PATH="$JAVA_HOME:$PATH:$HOME/.julia/conda/3/bin"


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

