#!/bin/sh
# TODO: simplify ip matching

ip=$(/usr/bin/ip a | /usr/bin/grep 'UP' -A2 | /usr/bin/grep 'inet\s' | /usr/bin/tail -n1 | /usr/bin/awk '{print $2}' | /usr/bin/cut -f1 -d'/')

[ -n "${BLOCK_BUTTON}" ] && case "${BLOCK_BUTTON}" in
    1) echo -n "${ip}" | /usr/bin/xclip -selection c & /usr/bin/notify-send "IP address copied" ;; # left click, copy address
    *) ;;
esac
[ ! -d /sys/class/net/eth0/phydev ] || [ "$(/usr/bin/cat /sys/class/net/eth0/operstate || true)" = 'down' ] && exit 0

echo "${ip}"
