#!/usr/bin/env sh

# Terminate already running bar instances
killall -9 -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.2; done

for monitor in $(polybar -m | awk -F: '{print $1}'); do
    echo found $monitor
    # Try to find monitor specific bar, otherwise fall back to "default"
    if grep -q bar/$monitor ~/.config/polybar/config; then
        bar=$monitor
    else
        bar=default
    fi
    polybar $bar &
done
