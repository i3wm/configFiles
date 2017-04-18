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

# Check the gtk version with the command `dpkg -l libgtk-3-0`
dpkg -l libgtk-3-0
sleep 1
printf '\nFrom the above output check your gtk version (such as 3.18, 3.20, etc.).\n'
sleep 1
read -p 'What is your gtk version? ' gtk

# Install ubuntu-restricted-extras
printf '\nThis script contains installation of `ubuntu-restricted-extras` which has user approval dialogue.\n'
echo -n 'Enter your root password: '
read -s passwd
echo "Password accepted."
echo $passwd | sudo -S echo " "

sudo apt update && sudo apt install -y gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-fluendo-mp3 oxideqt-codecs-extra ttf-mscorefonts-installer unrar libavcodec-extra

sudo -K

# Download arc-grey-theme
printf '\nDownloading arc-grey-theme . . .\n'
sleep 1
mkdir -p /tmp/arc-grey-theme && cd /tmp/arc-grey-theme 
sleep 1
git init
sleep 1
git remote add origin https://github.com/eti0/arc-grey-theme
sleep 1
git config core.sparsecheckout true
sleep 1
echo "builds/*" >> .git/info/sparse-checkout
sleep 1
git pull --depth=1 origin master

# Install arc-grey-theme
printf '\nInstalling arc-grey-theme . . .\n'
sleep 1
cd builds
sleep 1
tar -xvzf $gtk.tar.gz
sleep 1
echo $passwd | sudo -S echo " "
sudo cp -R Arc-Dark-Grey Arc-Grey /usr/share/themes
sudo -K

# Download mint-y-theme
printf '\nDownloading mint-y-theme . . .\n'
sleep 1
mkdir -p /tmp/mint-y-theme && cd /tmp/mint-y-theme
sleep 1
git init
sleep 1
git remote add origin https://github.com/linuxmint/mint-y-theme
sleep 1
git config core.sparsecheckout true
sleep 1
echo "usr/share/themes/*" >> .git/info/sparse-checkout
sleep 1
git pull --depth=1 origin master

# Install mint-y-theme
printf '\nInstalling mint-y-theme . . .\n'
sleep 1
cd usr/share/themes
sleep 1
echo $passwd | sudo -S echo " "
sudo cp -R Mint-Y Mint-Y-Dark Mint-Y-Darker /usr/share/themes
sudo -K

# Download Font-Awesome
printf '\nDownloading Font-Awesome . . .\n'
sleep 1
mkdir -p /tmp/font-awesome && cd /tmp/font-awesome 
sleep 1
git init
sleep 1
git remote add origin https://github.com/FortAwesome/Font-Awesome
sleep 1
git config core.sparsecheckout true
sleep 1
echo "fonts/*" >> .git/info/sparse-checkout
sleep 1
git pull --depth=1 origin master

# Install Font-Awesome
printf '\nInstalling Font-Awesome . . .\n'
sleep 1
cd fonts
sleep 1
echo $passwd | sudo -S echo " "
sudo mkdir -p /usr/share/fonts/custom
sleep 1
sudo cp FontAwesome.otf /usr/share/fonts/custom
sudo -k

# Download Yosemite-San-Francisco
printf '\nDownloading Yosemite-San-Francisco . . .\n'
sleep 1
mkdir -p /tmp/yosemite && cd /tmp/yosemite
sleep 1
git init
sleep 1
git remote add origin https://github.com/supermarin/YosemiteSanFranciscoFont
sleep 1
git pull --depth=1 origin master

# Install Yosemite-San-Francisco
printf '\nInstalling Yosemite-San-Francisco . . .\n'
sleep 1
echo $passwd | sudo -S echo " "
sudo cp -r *.ttf /usr/share/fonts/custom
sudo -k

# Download Monaco and TimesNewRoman
printf '\nDownloading Monaco . . .\n'
sleep 1
mkdir -p /tmp/monaco && cd /tmp/monaco
sleep 1
git init
sleep 1
git remote add origin https://github.com/i3wm/minimal
sleep 1
git pull --depth=1 origin master

# Install Monaco and TimesNewRoman
printf '\nInstalling Monaco . . .\n'
sleep 1
echo $passwd | sudo -S echo " "
sudo cp Monaco.ttf /usr/share/fonts/custom
sudo -K

# Update font cache
sleep 1
echo $passwd | sudo -S echo " "
sudo fc-cache -fv
sudo -K

# Install cursor theme
printf '\nDownloading cursor theme . . .\n'
sleep 1
mkdir -p /tmp/aesthetic && cd /tmp/aesthetic
sleep 1
git init
sleep 1
git remote add origin https://github.com/i3wm/aesthetic
sleep 1
git pull origin master
printf '\nInstalling cursor theme . . .\n'
sleep 1
echo $passwd | sudo -S echo " "
sudo cp -r ComixCursors-White /usr/share/icons
sleep 1
sudo sed -i '/Inherits/c\Inherits\=ComixCursors\-White' /usr/share/icons/default/index.theme
sudo -K

# Power button config
echo $passwd | sudo -S echo " "
sleep 1
sudo sed -i '/HandlePowerKey/c\HandlePowerKey\=ignore' /etc/systemd/logind.conf
sudo -K

# Install clipboard for urxvt
printf '\nInstalling Urxvt clipboard . . .\n'
sleep 1
mkdir -p /tmp/urxvt && cd /tmp/urxvt
sleep 1
git init
sleep 1
git remote add origin https://github.com/i3wm/urxvt
sleep 1
git pull origin master
sleep 1
echo $passwd | sudo -S echo " "
sudo mkdir -p /usr/lib/urxvt/perl
sudo cp clipboard /usr/lib/urxvt/perl/
sudo -K

# Set vim globally as editor
sleep 1
echo $passwd | sudo -S echo " "
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 100
sudo -K

# Set urxvt as global terminal
sleep 1
echo $passwd | sudo -S echo " "
sudo update-alternatives --config x-terminal-emulator
sudo -K

# Message
printf '\nApply themes with lxappearance and change fonts in .gtkrc-2.0 & settings.ini\n'

# System reboot
printf '\nRebooting the system . . .\n'
sleep 1
systemctl reboot
