#!/usr/bin/env bash
#                   __      __
#      ____  ____  / /_  __/ /_  ____ ______
#     / __ \/ __ \/ / / / / __ \/ __ `/ ___/
#    / /_/ / /_/ / / /_/ / /_/ / /_/ / /
#   / .___/\____/_/\__, /_.___/\__,_/_/
#  /_/            /____/
# Polybar launch script.
# Modified from WillemMe: https://github.com/WillemMe/dotFiles

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

DP_ACTIVE=$(xrandr | grep ' connected' | grep 'DP-0' | awk '{print $1}' | xargs);
HDMI_ACTIVE=$(xrandr | grep ' connected' | grep 'HDMI-0' | awk '{print $1}' | xargs);
GPU_MODE=$(optimus-manager --print-mode | awk '{print $NF}' | xargs);

if [ "$GPU_MODE" = 'nvidia' ] && [ -n "$DP_ACTIVE" ] || [ -n "$HDMI_ACTIVE" ] ; then
	if [ -n "$DP_ACTIVE" ] ; then monitors="$DP_ACTIVE";
	elif [ -n "$HDMI_ACTIVE" ] ; then monitors="$HDMI_ACTIVE";
	fi;
else
	monitors=$(xrandr --query | grep "^eDP" | grep " connected" | cut -d" " -f1);
fi;

# Single monitor only because no solution to multi-monitor screen-tear prevention on my machine
MONITOR="${monitors[0]}" polybar main &
MONITOR="${monitors[0]}" polybar bottom &


# Multi-monitor handling
#if type "xrandr"; then
#	#Get monitors
#	monitors=$(xrandr --query | grep " connected" | cut -d" " -f1)
#
#	#If only 1 montor set it as default
#	if [ ${#monitors[@]} == "0" ]; then
#		MONITOR="${monitors[0]}" polybar main &
#		MONITOR="${monitors[0]}" polybar bottom &
#	else #with more screen set the "bigger" as main
#		for m in $monitors; do
#			if [ $m == "eDP-1" ]; then
#				MONITOR=$m polybar secondary &
#			else
#				MONITOR=$m polybar main &
#				MONITOR=$m polybar bottom &
#			fi
#		done
#	fi
#fi

