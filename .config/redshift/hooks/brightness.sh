#!/bin/sh

# Downloaded from https://github.com/subnixr/.dotfiles/blob/master/redshift/.config/redshift/hooks/brightness.sh

# Set brightness via xbrightness when redshift status changes

PATH=$PATH:/run/current-system/sw/bin

brightness_day="60"
brightness_transition="30"
brightness_night="10"
fade_time=20000

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
