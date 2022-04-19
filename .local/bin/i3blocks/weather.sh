#!/bin/sh

/usr/bin/curl wttr.in/?format="%c+/%Z:+%f+💧%h\n" | /usr/bin/sed 's/\/.*\///'
