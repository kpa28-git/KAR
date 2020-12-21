#!/bin/sh
# systemd aliases

alias sstart="sudo systemctl start" \
	sstop="sudo systemctl stop" \
	senable="sudo systemctl enable" \
	sdisable="sudo systemctl disable" \
	srestart="sudo systemctl restart" \
	sstatus="systemctl status";

