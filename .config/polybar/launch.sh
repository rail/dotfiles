#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.2; done

for monitor in $(polybar -m | awk -F: '{print $1}'); do
    echo found $monitor
    if grep -q bar/$monitor ~/.config/polybar/config; then
        polybar $monitor &
    fi
done
