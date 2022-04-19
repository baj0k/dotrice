#!/bin/sh

/usr/bin/df -hP | /usr/bin/grep -E "/home$" | /usr/bin/awk -F' ' '{print $3" / "$2}'
