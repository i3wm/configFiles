#!/bin/bash

if [[ ! -f /tmp/rwifi/firstrun ]]; then
	mkdir -p '/tmp/rwifi';
	iwconfig | grep IEEE | awk '{print $1}' > '/tmp/rwifi/firstrun';
else
	con=`cat /tmp/rwifi/firstrun`;
	check=`nmcli c | grep $con | awk '{print $NF}'`;
	if [[ "$check" == `cat /tmp/rwifi/firstrun` ]]; then
		nmcli r wifi off;
	else
		#for some bizzare reasons this command needs to be run thrice to turn on wifi
		for i in {1..3}; do
			nmcli r wifi on;
		done
	fi
fi

exit 0

