#!/bin/bash

# Message
printf '\nUpdating rclone . . .\n'
sleep 1
printf '\nDownloading rclone . . .\n'
sleep 1
mkdir -p /tmp/rclone && cd /tmp/rclone
sleep 1
wget -c http://downloads.rclone.org/rclone-current-linux-386.zip
sleep 1
unzip rclone-current-linux-386.zip
sleep 1
cd $(ls --group-directories-first | head -n1)
sleep 1
printf '\nInstalling rclone . . .\n'
cp rclone $HOME/.local/bin/
sleep 1
cp rclone.1 $HOME/.local/share/man/man1/
printf '\nrclone updated!\n'
