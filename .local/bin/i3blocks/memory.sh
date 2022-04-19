#!/bin/sh

/usr/bin/free -m | /usr/bin/awk 'NR==2{printf "%.1fG", $3/1024; printf "%.1fG\n", $2/1024; }' | /usr/bin/sed 's/G/G\ \/\ /'
