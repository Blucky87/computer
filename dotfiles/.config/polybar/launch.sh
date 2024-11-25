#!/bin/bash

killall -q polybar

polybar primary 2>&1 | tee -a /tmp/polybar.log & disown
polybar top 2>&1 | tee -a /tmp/polybar.log & disown
polybar left 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched"
