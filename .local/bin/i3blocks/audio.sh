#!/bin/sh
# TODO: check if still working after migration to pipewire

[ -n "${BLOCK_BUTTON}" ] && case "${BLOCK_BUTTON}" in
    1) /usr/bin/pactl set-sink-mute "@DEFAULT_SINK@" toggle ;; # left click, toggle mute
    4) /usr/bin/pactl set-sink-volume "@DEFAULT_SINK@" +5% ;; # scroll up, increase
    5) /usr/bin/pactl set-sink-volume "@DEFAULT_SINK@" -5% ;; # scroll down, decrease
    *) ;;
esac

/usr/bin/pamixer --get-volume-human
