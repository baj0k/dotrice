#!/bin/sh

ip=$(/usr/bin/ip addr | /usr/bin/grep 'UP' -A2 | /usr/bin/tail -n1 | /usr/bin/awk '{print $2}' | /usr/bin/cut -f1  -d'/')

[ -n "${BLOCK_BUTTON}" ] && case "${BLOCK_BUTTON}" in
    1) echo "${ip}" | /usr/bin/xclip -selection c && /usr/bin/notify-send "IP address copied" ;; # left click, copy address
    *) ;;
esac
[ ! -d /sys/class/net/eth0/phydev ] || [ "$(/usr/bin/cat /sys/class/net/eth0/operstate || true)" = 'down' ] && exit

echo "${ip}"
