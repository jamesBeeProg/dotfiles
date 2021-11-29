#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch bar1 and bar2
MONITOR=DP-1 polybar regular 2>&1 | tee -a /tmp/polybar1.log & disown
MONITOR=DVI-I-1 polybar regular 2>&1 | tee -a /tmp/polybar2.log & disown
