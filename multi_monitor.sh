#!/bin/sh
data=$(xrandr --listactivemonitors)
if [[ $data == *"VGA"* ]] && [[ $data == *"HDMI"* ]];
then
# go to hdmi as primary monitor and vga off
    xrandr --output VGA-0 --off --output DVI-0 --off --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal
else
	if [[ $data == *"HDMI"* ]];
	then
	# go to vga as primary and hdmi off
	    xrandr --output VGA-0 --primary --mode 1280x720 --pos 0x0 --rotate normal --output DVI-0 --off --output HDMI-0 --off
	else
	# make hdmi primary
	    xrandr --output VGA-0 --off --output DVI-0 --off --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal
	# then switch to both otherwise the apps dont move to primary screen
		xrandr --output VGA-0 --mode 1280x720 --pos 0x1080 --rotate normal --output DVI-0 --off --output HDMI-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal
	fi
fi