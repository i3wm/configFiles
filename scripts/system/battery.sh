#!/bin/bash

BATTINFO=`acpi -b`

if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:30:00 ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send -u critical "LOW BATTERY. PLEASE HIBERNATE." "$BATTINFO"
fi

exit 0
