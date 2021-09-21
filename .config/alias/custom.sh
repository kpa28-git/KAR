#!/bin/sh
# custom aliases and functions go here

# search aliases
alias lspaths="fd -HI --ignore-file \"\$HOME\"/.config/fd/ignore_file" \
	s="lspaths | fzf --reverse --info=inline --preview='pistol {}'" \
	se="\$EDITOR \"\$(s --header='Edit File')\"" \
	sd="moveto \"\$(s --header='Search Directory')\"" \
	so="\$OPENER \"\$(s --header='Open File')\"" \
	sr="\$READER \"\$(fd -I -t 'f' '.' \"\$READING\" | sed \"s|\$READING\/||\" | fzf --reverse --info=inline --preview=\"pistol \$READING/{}\" --header='Select Reading' | sed \"s|^|\$READING\/|\")\"" \
	srl="\$READER \"\$(cat \"\$READING\"/list.txt | fzf --reverse --info=inline --preview=\"pistol \$READING/{}\" --header='Select from Reading List' | sed \"s|^|\$READING\/|\")\"";

# history aliases
alias h="history" \
	hg="h | grep" \
	hs="h | fzf --tac --info=inline --header='Search Command' | sed 's/^[0-9]*\s*//g'" \
	hi="xdotool type --delay 0 \"\$(hs)\" && clear";

moveto() {
	FILEPATH=$([ -d "$1" ] && echo "$1" || dirname "$1");
	cd "$FILEPATH" || return;
}
sg() {
	RES="$(s --header='Grep File')";
	grep "$1" "$RES";
}
tunder() {
	for i in *' '*; do   mv "$i" `echo $i | sed -e 's/ /_/g'`; done
}

#command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d" # Alias neovim as vim if present.
#vf() {
#	fzf | xargs -r -I % $EDITOR % ;
#}
#shdl() { curl -O $(curl -s http://sci-hub.tw/"$@" | grep location.href | grep -o http.*pdf) ;}
#sv() { vcopy "$(du -a ~/.local/bin/* ~/.config/* | awk '{print $2}' | fzf)" ;}
