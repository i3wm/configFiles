#!/bin/bash

maim /tmp/screen.png

#convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
convert /tmp/screen.png -blur 0x4 /tmp/screen.png

composite -gravity SouthEast $HOME/Pictures/lockicons/lock.png /tmp/screen.png /tmp/screen.png

#[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png
#dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop

i3lock -ue -p default -i /tmp/screen.png
xset dpms force off
rm /tmp/screen.png
audtool --playback-paused
if [ `echo $?` == '1' ]; then
	audtool --playback-pause
fi
