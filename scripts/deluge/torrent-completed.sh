#!/bin/bash

DISPLAY=:0.0 /usr/bin/notify-send "DELUGE: Torrent Download Completed."
paplay $HOME/scripts/deluge/notification.wav

exit 0
