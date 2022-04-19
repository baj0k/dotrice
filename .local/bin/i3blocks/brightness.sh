#!/bin/sh
# TODO: try removeing the if statement

[ -n "${BLOCK_BUTTON}" ] && case "${BLOCK_BUTTON}" in
    1) /usr/bin/redshift -O 2500 > /dev/null 2>&1 ;; # left click, enable redshift
    2) /usr/bin/xbacklight 0 ;; # middle click, set 0
    3) /usr/bin/xbacklight 100 && /usr/bin/redshift -P -O 5500 > /dev/null 2>&1 ;; # right click, reset
    4) /usr/bin/xbacklight +5 ;; # scroll up, increase
    5) if [ "$(/usr/bin/xbacklight -get)" -lt 6 ];then /usr/bin/xbacklight 1;else /usr/bin/xbacklight -5;fi ;; # scroll down, decrease
    *) ;;
esac
/usr/bin/xbacklight -get
