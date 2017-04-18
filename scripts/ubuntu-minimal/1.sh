#!/bin/bash

# Notification to backup all important hidden files or folders
printf '\nIf there are any important hidden files or folders in the `$HOME` directory of the user then backup it up and re-run the script.\n'
read -p 'Continue? (y/n): ' choice1
case "$choice1" in
	y* | Y*) gtr1=1;;
	*) exit;;
esac

# Release variable
unset gtr1
unset choice1

# Declaring variables. Change accordingly
# Check the wireless device name such as wlan0, wlp1s0, etc. with the command `iwconfig`
iwconfig
printf '\nPlease check the interface name (such as: wlan0, wlp1s0, etc.) from the above output for your wireless device.\n'
sleep 5
read -p 'Enter the wireless interface name: ' conn

# WiFi connection ssid
read -p 'Please enter the ssid of your wireless network: ' ssid
# WiFi password
read -p 'Please enter the password for your wireless network: ' psk

dir=$HOME/tsmjdhf

# Previous user
read -p 'Please enter the username of the previous user: ' user

# Warning
#printf '\nPLEASE MODIFY THE VARIABLES IN THE SCRIPT ACCORDINGLY AND THEN RE-RUN THE SCRIPT.\n'
#read -p 'Continue? (y/n): ' choice
#case "$choice" in
#	y* | Y*) gtr=1;;
#	*) exit;;
#esac

# Release variable
#unset gtr
#unset choice

# Creating a config file to connect to wifi using wpa_supplicant and dhclient
printf '\nGenerating passphrase for wireless . . .\n'
wpa_passphrase "$ssid" "$psk" > $HOME/wpa.conf

# Accept password
sleep 1
echo -n 'Enter your root password: '
read -s passwd
echo "Password accepted."

# Setting up wpa_supplicant with the above conf
sleep 1
echo $passwd | sudo -S echo " "
printf '\nRunning wpa_supplicant . . .\n'
sudo wpa_supplicant -B -i$conn -c$HOME/wpa.conf

# Connecting to the wifi
sleep 1
sudo dhclient -v $conn
sudo -K

<<COMMENT1
# Backing up config files if existing
sleep 1
printf '\nBacking up configuration files (if existing) . . .\n'
if [[ -d $HOME/.config/i3 ]]; then
	mkdir -p $dir
	cp -r $HOME/.config/i3 $dir
fi

if [[ -d $HOME/.config/dunst ]]; then
	cp -r $HOME/.config/dunst $dir
fi

if [[ -d $HOME/.conky ]]; then
	cp -r $HOME/.conky $dir
fi

if [[ -d $HOME/.local/rofi ]]; then
	cp -r $HOME/.local/rofi $dir
fi

if [[ -d $HOME/.vim ]]; then
	cp -r $HOME/.vim $dir
fi

if [[ -f $HOME/.Xresources ]]; then
	cp $HOME/.Xresources $dir
fi

if [[ -f $HOME/.vimrc ]]; then
	cp $HOME/.vimrc $dir
fi

if [[ -f $HOME/.zshrc ]]; then
	cp $HOME/.zshrc $dir
fi

if [[ -f $HOME/.xinitrc ]]; then
	init=1
	cp $HOME/.xinitrc $dir
fi

sleep 1
echo $passwd | sudo -S echo " "
printf '\nRemoving all hidden files or folders in $HOME . . .\n'
sudo rm -rf $HOME/.*
sudo -K
COMMENT1

# Installing necessary packages to get to gui
sleep 1
echo $passwd | sudo -S echo " "
sudo apt install -y xorg i3 ufw network-manager-gnome rxvt-unicode-256color xsel
sudo -K

# Enabling firewall
sleep 1
printf '\nEnabling Firewall . . .\n'
echo $passwd | sudo -S echo " "
sudo ufw enable
sudo -K

# Making a xinitrc file
sleep 1
printf '\nMaking a basic .xinitrc file . . .\n'
if [[ "$init" != "1" ]]; then
	sleep 1
	printf '#!/bin/sh\n\nexec i3' > $HOME/.xinitrc
fi

# Reomving wpa.conf
rm -rf $HOME/wpa.conf

# Restore all configuration
sleep 1
printf "\nAll the relevant configuration files (if was present)  have been backed up in %s. Please restore it accordingly with the script.\n" "$dir"
read -p 'OK?' ok
case "$ok" in
	*) exit;;
esac

#Release variable
unset ok

exit 0
