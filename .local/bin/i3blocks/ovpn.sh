#!/bin/sh

OPENVPN_DIR="${XDG_DATA_HOME:?}/openvpn"
connection=$(/usr/bin/basename "$(/usr/bin/pgrep openvpn -a | grep -o "[^/]*\.ovpn" || true)" .ovpn)

[ -n "${BLOCK_BUTTON}" ] && case "${BLOCK_BUTTON}" in
    1) # left click, start selected connection
       [ -n "${connection}" ] && /usr/bin/notify-send "Active connection detected"
       [ -z "${connection}" ] && connection=$(/usr/bin/find "${OPENVPN_DIR}" -name '*.ovpn' -exec /usr/bin/basename {} .ovpn \; | dmenu -i -p "Select connection:") &&
       /usr/bin/notify-send "Connecting to: ${connection}";
       /usr/bin/sudo /usr/bin/openvpn --config "${OPENVPN_DIR}/${connection}.ovpn" --daemon 1>/dev/null 2>&1 ;;
 
    3) # right click, stop current connection
       /usr/bin/sudo /usr/bin/killall openvpn && connection=off ;;
    *) ;;
esac

echo "${connection:-off}"
