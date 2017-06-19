#!/bin/sh

# Downloaded from https://github.com/subnixr/.dotfiles/blob/master/redshift/.config/redshift/hooks/brightness.sh

# Set brightness via xbrightness when redshift status changes

brightness_day="100"
brightness_transition="50"
brightness_night="20"
fade_time=60000

case $1 in
    period-changed)
        case $3 in
            night)
                xbacklight -set $brightness_night -time $fade_time
                ;;
            transition)
                xbacklight -set $brightness_transition -time $fade_time
                ;;
            daytime)
                xbacklight -set $brightness_day -time $fade_time
                ;;
        esac
        ;;
esac
