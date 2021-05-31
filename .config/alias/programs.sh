#!/bin/sh
# program and web api aliases

# misc programs
alias mpv="mpv --input-ipc-server=/tmp/mpvsoc\$(date +%s)" \
	x="sxiv -ft *" \
	ytd="youtube-dl --add-metadata -i -o '\$HOME/Downloads/%(upload_date)s-%(title)s.%(ext)s'" \
	ytda="youtube-dl --add-metadata -i -x -f 'bestaudio/best' -o '\$HOME/Music/%(upload_date)s-%(title)s.%(ext)s'" \
	ffmpeg="ffmpeg -hide_banner" \
	dt="dust" \
	dt3="dt -d 3" \
	grex="grex -r" \
	ccat="highlight --out-format=ansi" \
	appsync="rsync -avxP" \
	mirsync="rsync -avxP --delete" \
	shck="shellcheck" \
	tmr="peaclock --config-dir=\"\$XDG_CONFIG_HOME/peaclock\" --config=\"\$(fd '[^\.gitignore]' --regex -t 'f' -d 1 \"$XDG_CONFIG_HOME/peaclock\" | fzf --select-1)\"" \
	viewdoc="fzf --sync | pandoc -f docx -t pdf | zathura -" \
	vd="vidir" \
	pwi="sudo powertop" \
	nv="nvidia-smi" \
	nvw="watch2 nv" \
	nvi="nvtop" \
	jup="jupyter notebook --ip=127.0.0.1 --port=8888";

alias g="git" \
	gst="g status" \
	gsb="gst -sb" \
	gss="gst -s" \
	gd="g diff --color" \
	gds="gd \$(gss | awk '{print \$NF}' | fzf --reverse --info=inline --preview='git diff --color {}' --header 'git diff file')" \
	gdc="gd --cached" \
	gdcs="gd --cached \$(gss | awk '{print \$NF}' | fzf --reverse --info=inline --preview='git diff --color --cached {}' --header 'git diff cached (staged) file changes')" \
	gdh="gd HEAD" \
	gdhs="gd HEAD \$(gss | awk '{print \$NF}' | fzf --reverse --info=inline --preview='git diff --color HEAD {}' --header 'git diff changes compared to HEAD')" \
	gc="g clone" \
	gls="g log" \
	gl="g pull" \
	gp="g push" \
	gulp="g submodule foreach git pull origin master" \
	ga="g add" \
	gas="ga \$(gss | awk '{print \$NF}' | fzf --multi --reverse --info=inline --preview='git diff --color {}' --header 'git add files, use shift+Tab to multiselect')" \
	gr="g remote" \
	grm="g rm" \
	gcsmg="g commit -m" \
	gcmsg="g commit -m" \
	gcmsga="g commit --amend" \
	gua="gr | xargs -L1 git push --all" \
	glp="gl && gp";

alias gpglspub="gpg --list-keys" \
	gpglssec="gpg --list-secret-keys --keyid-format LONG" \
	gpggen="gpg --full-generate-key" \
	gpgimp="gpg --import";

alias cg="conda list | grep" \
	cq="conda search --info" \
	cls="conda list" \
	car="conda activate" \
	cdr="conda deactivate" \
	cup="conda update conda pip" \
	cua="conda update --all" \
	crm="conda remove" \
	ccl="conda clean --yes --all";

alias tdd="trash-put" \
	tls="trash-list | \$PAGER" \
	tre="trash-restore" \
	trm="trash-rm \"\$(trash-list | fzf --reverse --info=inline --header='Delete File' | awk '{print \$NF}')\"" \
	tem="trash-empty";

alias coins="curl -s rate.sx" \
	eth1="curl -s rate.sx/eth@1w" \
	eth2="curl -s rate.sx/eth@2w" \
	eth4="curl -s rate.sx/eth@4w" \
	eth8="curl -s rate.sx/eth@8w" \
	eth24="curl -s rate.sx/eth@24w" \
	eth52="curl -s rate.sx/eth@52w" \
	btc2="curl -s rate.sx/btc@2w" \
	ada2="curl -s rate.sx/ada@2w";

