#!/bin/bash

KEYC=`xset -q | grep Caps | awk '/00/ {print $4}'`
KEYN=`xset -q | grep Caps | awk '/00/ {print $8}'`

echo -e "CAPS\t" [${KEYC}] #" 1" [${KEYN}]
echo -e "NUM\t" [${KEYN}]

exit 0
