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

# Aptik backup directory
sleep 1
printf '\nPlease enter the absolute location of Aptik backup directory:- '
read -p dir

# Accept password
sleep 1
echo -n 'Enter your root password: '
read -s passwd
echo "Password accepted."

# Enabling firewall
sleep 1
printf '\nEnabling Firewall . . .\n'
echo $passwd | sudo -S echo " "
sudo ufw enable
sudo -K

# Removing unwanted packages
sleep 1
echo $passwd | sudo -S echo " "
sudo apt-get remove --purge -y scrot xfburn gpick mtpaint abiword gnumeric xpad
sudo -K

# Setting up apt such that it doesn't keep or install recommended and suggested packages
sleep 1
echo $passwd | sudo -S echo " "
printf '\nSetting up no-install-recommends . . .\n\n'
printf 'APT::Install-Recommends "false";\nAPT::AutoRemove::RecommendsImportant "false";\nAPT::AutoRemove::SuggestsImportant "false";' | sudo tee /etc/apt/apt.conf.d/99_norecommends
printf '\n'

# Autoremove recommended and suggested packages
sleep 1
sudo apt-get autoremove -y
sudo apt-get autoclean
sudo apt-get clean
sudo -K

# Adding aptik ppa
sleep 1
echo $passwd | sudo -S echo " "
sudo add-apt-repository ppa:teejee2008/ppa -y
sudo apt update
sudo apt -y install aptik
sudo -K

# Restoring ppas and crontab with aptik
sleep 1
cd $dir
sleep 1
echo $passwd | sudo -S echo " "
sudo aptik --yes --restore-ppa
sudo -K
sleep 1
echo $passwd | sudo -S echo " "
sudo aptik --yes --restore-crontab
sudo -K
sleep 1
cd

# Install necessary packages that were autoremoved by the previous command plus extra packages
sleep 1
echo $passwd | sudo -S echo " "
sudo apt update
sudo -K
sleep 1
echo $passwd | sudo -S echo " "
sudo apt-get dist-upgrade -y
sudo -K
sleep 1
echo $passwd | sudo -S echo " "
sudo apt install -y chromium-browser zsh wget ca-certificates mc alsa-utils pulseaudio pavucontrol compton libnotify-bin conky parcellite vim vim-gtk gksu unzip gtk2-engines-pixbuf gtk2-engines-murrine gpicview mpv acpi ncdu git feh xinit i3 i3status i3lock rofi rxvt-unicode-256color xsel gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-fluendo-mp3 oxideqt-codecs-extra ttf-mscorefonts-installer unrar libavcodec-extra
sudo -K

# Using aptik to restore packages
sleep 1
echo $passwd | sudo -S echo " "
sudo aptik --yes --restore-packages
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
sleep 1
echo $passwd | sudo -S echo " "
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
