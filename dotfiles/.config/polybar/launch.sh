#!/bin/bash

# Stop any running bars and *wait* for them to actually exit before starting
# new ones. killall returns as soon as SIGTERM is sent, so without this wait a
# bar from the previous layout can still be alive when the new one appears --
# which shows up as two bars stacked on one screen.
killall -q polybar
for _ in $(seq 30); do
    pgrep -u "$UID" -x polybar >/dev/null || break
    sleep 0.1
done
# Anything still up after ~3s is not going to leave on its own.
if pgrep -u "$UID" -x polybar >/dev/null; then
    killall -q -9 polybar
    sleep 0.2
fi

if [ "$X_LAYOUT" = "1080p" ]; then
    # One screen, one bar. [bar/primary] honours $MONITOR.
    MONITOR="${X_PRIMARY:-$(xrandr --query | awk '/ connected primary/ { print $1; exit }')}"
    export MONITOR
    polybar primary 2>&1 | tee -a /tmp/polybar.log & disown
    echo "Polybar launched on $MONITOR"
else
    unset MONITOR
    polybar primary 2>&1 | tee -a /tmp/polybar.log & disown
    polybar top 2>&1 | tee -a /tmp/polybar.log & disown
    polybar left 2>&1 | tee -a /tmp/polybar.log & disown
    echo "Polybar launched"
fi
