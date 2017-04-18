#!/bin/bash

mkdir -p /tmp/rclone && cd /tmp/rclone

wget -c --no-check-certificate https://www.rclone.org/changelog

CHECK=`cat changelog | grep \<li\>v | head -n1 | awk '{print $1}' | awk -F'>' '{print $2}'`

if [[ `echo $CHECK` == "v1.34" ]]; then
	echo '*. Old Rclone ' "$CHECK" >> $HOME/Documents/thingstodo/list
else
	echo '*. New Rclone ' "$CHECK" >> $HOME/Documents/thingstodo/list
fi
