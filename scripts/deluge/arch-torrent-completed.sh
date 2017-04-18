#!/bin/bash

DISPLAY=:0.0 DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" /usr/bin/notify-send "DELUGE: Torrent Download Completed."
paplay $HOME/scripts/deluge/notification.wav

exit 0
