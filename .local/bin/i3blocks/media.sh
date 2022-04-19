#!/bin/sh
# TODO: try to simplify logic

[ -n "${BLOCK_BUTTON}" ] && case "${BLOCK_BUTTON}" in
    1) /usr/bin/mpc toggle > /dev/null 2>&1 ;; # left click, pause
    2) /usr/bin/mpc random > /dev/null 2>&1 ;; # middle click, randomize playlist
    3) /usr/bin/mpc repeat > /dev/null 2>&1 ;; # right click, repeat current song
    4) /usr/bin/mpc prev > /dev/null 2>&1 ;; # scroll up, next song
    5) /usr/bin/mpc next > /dev/null 2>&1 ;; # scroll down, previous song
    *) ;;
esac

/usr/bin/mpc status | /usr/bin/grep -q "paused" && paused="P"
/usr/bin/mpc status | /usr/bin/grep -q "random: on" && random="S"
/usr/bin/mpc status | /usr/bin/grep -q "repeat: on" && repeat="R"

current=$(/usr/bin/mpc current)
status="${paused}${random}${repeat}"
[ -n "${status}" ] && status="${status} | "
[ -n "${current}" ] && echo "${status}${current}"
