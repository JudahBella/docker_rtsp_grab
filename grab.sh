#!/bin/bash
/usr/sbin/lighttpd -D -f /lighttpd.conf &
url=$URL
fps=$FPS
ffmpeg -loglevel error -y -i $url -vf fps=$fps -vsync 1 -qscale 1 -f image2 -updatefirst 1 /tmp/www/snapshot.jpg
