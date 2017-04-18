#!/bin/bash

BATT=`acpi -b | grep 'Battery' | awk '{print $5}' | cut -c 1-5`

if [[ `echo $BATT` == 'until' ]]; then
	exit;
else
	echo $BATT;
fi

exit 0
