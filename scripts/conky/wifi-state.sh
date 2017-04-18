#!/bin/bash

#YELLOW='\033[1;33m';

wget -q --spider www.google.com

if [[ "$?" != 0 ]]; then
	echo Li > $HOME/scripts/conky/wifi-state;
else
	echo '' > $HOME/scripts/conky/wifi-state;
fi

exit 0
