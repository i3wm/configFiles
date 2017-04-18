#!/bin/bash

#RED='\033[0;31m';
#YELLOW='\033[1;33m';
#GREEN='\033[0;32m';

BATT=`acpi -b | cut -d ',' -f1 | cut -d ':' -f2`

if [[ `echo $BATT` == 'Charging' ]]; then
	echo CH;
elif [[ `echo $BATT` == 'Full' ]]; then
	echo F;
else
	echo DIS;
fi

exit 0
