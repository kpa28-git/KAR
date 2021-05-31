#!/usr/bin/env bash
#                   __      __
#      ____  ____  / /_  __/ /_  ____ ______
#     / __ \/ __ \/ / / / / __ \/ __ `/ ___/
#    / /_/ / /_/ / / /_/ / /_/ / /_/ / /
#   / .___/\____/_/\__, /_.___/\__,_/_/
#  /_/            /____/
# Polybar launch script.

if [ -z "$(pgrep -x polybar)" ]; then
	ACTIVE="$(polybar -m | cut -d':' -f1)";
	PRIMARY="$(printf '%s' "$ACTIVE" | sed -n '1p')";
	SECONDARY="$(printf '%s' "$ACTIVE" | sed -n '2p')";
	MONITOR=$PRIMARY polybar --reload main &
	MONITOR=$PRIMARY polybar --reload bottom &
	# MONITOR=$SECONDARY polybar --reload secondary &

	# Multi monitor bar mirroring: https://github.com/polybar/polybar/issues/763
	# for m in $(polybar --list-monitors | cut -d":" -f1); do
	# 	MONITOR=$m polybar --reload main &
	# 	MONITOR=$m polybar --reload bottom &
	# done
else
	polybar-msg cmd restart
fi
