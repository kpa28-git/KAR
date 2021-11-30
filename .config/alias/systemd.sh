#!/bin/sh
# systemd aliases

alias jlog="journalctl" \
	jlogboot="jlog -b" \
	jlogx="jlog -xe";

alias xlog="$PAGER /var/log/Xorg.0.log" \
	xlogold="$PAGER /var/log/Xorg.0.log";

alias sstart="sudo systemctl start" \
	sstop="sudo systemctl stop" \
	senable="sudo systemctl enable" \
	sdisable="sudo systemctl disable" \
	srestart="sudo systemctl restart" \
	sstatus="systemctl status";

