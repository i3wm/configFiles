#!/bin/bash

# This script is to reload i3bar after login if not visible

i3 reload
sleep 1

killall i3bar
sleep 1

for c in $(i3-msg -t get_bar_config | python -c \
      'import json,sys;print("\n".join(json.load(sys.stdin)))'); do \
    (i3bar --bar_id=$c >i3bar.$c.log 2>&1) & \
  done;

 exit 0
