#!/bin/bash

# Check if the internet connection connection was configured properly
printf '\nDid you configure the internet connection properly by running both `nm-connection-editor` & `nm-applet`?\n'

read -p 'Continue? (y/n): ' choice
case "$choice" in
	y* | Y*) gtr=1;;
	*) exit;;
esac

# Release variable
unset gtr
unset choice

# Accept password
echo -n 'Enter your root password: '
read -s passwd
echo "Password accepted."

# Setting up apt such that it doesn't keep or install recommended and suggested packages
sleep 1
echo $passwd | sudo -S echo " "
printf '\nSetting up no-install-recommends . . .\n\n'
printf 'APT::Install-Recommends "false";\nAPT::AutoRemove::RecommendsImportant "false";\nAPT::AutoRemove::SuggestsImportant "false";' | sudo tee /etc/apt/apt.conf.d/99_norecommends

# Autoremove recommended and suggested packages
sleep 1
sudo apt-get autoremove -y
sudo apt-get autoclean
sudo apt-get clean
sudo -K

# Install necessary packages that were autoremoved by the previous command plus extra packages
sleep 1
echo $passwd | sudo -S echo " "
sudo apt install -y xserver-xorg-video-intel i3status i3lock dunst rofi chromium-browser zsh wget ca-certificates mc alsa-utils pulseaudio pavucontrol compton libnotify-bin conky parcellite vim vim-gtk lxappearance gksu unzip gtk2-engines-pixbuf gtk2-engines-murrine software-properties-common gpicview mpv acpi ncdu git feh
sudo -K

# System reboot
sleep 1
printf '\nRebooting the system. . .\n'
sleep 1
systemctl reboot
