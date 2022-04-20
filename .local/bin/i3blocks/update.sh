#!/bin/sh
# TODO: change behaviour so that the i3bar hides icon after updates were installed

status=$(/usr/bin/checkupdates)
count=$(printf '%s' "${status}" | /usr/bin/wc -l)

[ -n "${BLOCK_BUTTON}" ] && case "${BLOCK_BUTTON}" in
    1) /usr/bin/notify-send "Installing updates..." && /usr/bin/yay -Syu --noconfirm > /dev/null 2>&1 && /usr/bin/notify-send "Updates installed" ;; # left click, update
    3) /usr/bin/notify-send "${status}" ;; # right click, list updates
    *)  ;;
esac

[ "${count}" != 0 ] && echo "${count}"
