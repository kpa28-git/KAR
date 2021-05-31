#!/bin/sh
# arch linux aliases

alias y="yay" \
	yg="y -Qs | grep" \
	yq="y -Qi" \
	yps="y -Ps" \
	yys="y -Syu" \
	yysp="y -Syu && poweroff" \
	yysr="y -Syu && reboot" \
	pacs="sudo pacman -Syu" \
	pacsp="sudo pacman -Syu && poweroff" \
	pacsr="sudo pacman -Syu && reboot" \
	yyf="y -Syyu" \
	yrm="y -Rsn" \
	yls="y -Ql" \
	ycl="y -Yc && paccache -r" \
	yrmlck="sudo rm '/var/lib/pacman/db.lck'" \
	pacls="pacman -Qett --color=always" \
	pacwhen="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort" \
	pacmirrup="sudo reflector --country 'United States' --latest 200 --age 24 --sort rate --save /etc/pacman.d/mirrorlist && rm -f /etc/pacman.d/mirrorlist.pacnew";

alias ifck="informant check" \
	ifls="informant list" \
	ifrd="informant read" \
	ifi="ifrd \"\$(ifls | fzf | sed 's/:.*//')\"";

alias lsfont="fc-list" \
	lsfontfam="lsfont : family";

