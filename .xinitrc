#!/bin/bash

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

xrandr --output DP-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-I-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal

exec i3
