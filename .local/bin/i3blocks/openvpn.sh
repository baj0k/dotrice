#!/bin/sh
OPENVPN_CLIENTS_DIR="/etc/openvpn/client/"
connection=$(/usr/bin/pgrep openvpn -a | /usr/bin/cut -d' ' -f 6- | /usr/bin/sed 's/.conf//')

[ -n "${BLOCK_BUTTON}" ] && case "${BLOCK_BUTTON}" in
    1) # left click, start selected connection
       connection=$(/usr/bin/find "${OPENVPN_CLIENTS_DIR:?}" -name '*.conf' -exec /usr/bin/basename {} .conf | dmenu -i -p "Select connection:")
       [ -n "${connection}" ] && /usr/bin/sudo /usr/bin/systemctl stop openvpn-client@* && /usr/bin/sudo /usr/bin/systemctl start openvpn-client@"${connection}" && /usr/bin/notify-send "Connected to: ${connection}" && /usr/bin/sleep 1 && /usr/bin/pkill -RTMIN+10 i3blocks ;;
    2) # middle click, restart current connection
       /usr/bin/sudo /usr/bin/systemctl restart openvpn-client@"${connection}" && /usr/bin/notify-send "Connection restarted" && /usr/bin/sleep 1 && /usr/bin/pkill -RTMIN+10 i3blocks ;;
    3) # right click, stop current connection
       /usr/bin/sudo /usr/bin/systemctl stop openvpn-client@"${connection}" && connection="off" && /usr/bin/pkill -RTMIN+10 i3blocks ;;
    *) ;;
esac

[ -z "${connection}" ] && connection="off"
echo "${connection}"
