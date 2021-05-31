#!/bin/sh
# alpine linux aliases

alias apku="sudo apk -U upgrade" \
	apki="sudo apk add" \
	apkr="sudo apk del" \
	apkq="apk info -a" \
	apkls="apk info" \
	apkg="apk info | grep" \
	apks="apk search" \
	apkps="apk stats" \
	commit="sudo lbu commit -d";

alias lsshells="$PAGER /etc/shells";

