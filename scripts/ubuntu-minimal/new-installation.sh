#!/bin/bash

# I3 config restore
printf '\nDownloading config for i3, compton & i3status . . .\n'
sleep 1
mkdir -p /tmp/i3 && cd /tmp/i3
sleep 1
git init
sleep 1
git remote add origin https://github.com/i3wm/i3
sleep 1
git pull origin master
sleep 1
printf '\nInstalling configs . . .\n'
sleep 1
mkdir -p $HOME/.config/i3
sleep 1
cp -r .i3status.conf compton.conf config $HOME/.config/i3

# Dunst config restore
sleep 1
printf '\nDownloading config for dunst . . .\n'
sleep 1
mkdir -p /tmp/dunst && cd /tmp/dunst
sleep 1
git init
sleep 1
git remote add origin https://github.com/i3wm/dunst
sleep 1
git pull origin master
sleep 1
printf '\nInstalling configs . . .\n'
sleep 1
mkdir -p $HOME/.config/dunst
sleep 1
cp -r dunstrc $HOME/.config/dunst

# Rofi config restore
sleep 1
printf '\nDownloading config for rofi . . .\n'
sleep 1
mkdir -p /tmp/rofi && cd /tmp/rofi
sleep 1
git init
sleep 1
git remote add origin https://github.com/i3wm/rofi
sleep 1
git pull origin master
sleep 1
printf '\nInstalling configs . . .\n'
sleep 1
mkdir -p $HOME/.local
sleep 1
cp -r rofi $HOME/.local

# Conky config restore
sleep 1
printf '\nDownloading config for conky . . .\n'
sleep 1
mkdir -p /tmp/conky && cd /tmp/conky
sleep 1
git init
sleep 1
git remote add origin https://github.com/i3wm/conky
sleep 1
git pull origin master
sleep 1
printf '\nInstalling configs . . .\n'
sleep 1
mkdir -p $HOME/.conky
sleep 1
cp -r noobslab .conkyrc $HOME/.conky

# Vim config restore
sleep 1
printf '\nDownloading config for vim . . .\n'
#sleep 1
mkdir -p /tmp/vim && cd /tmp/vim
#sleep 1
#wget -c -O vim.tar https://www.dropbox.com/s/hf7vl42awh4k1dy/vim.tar\?dl\=1
#sleep 1
#tar -xvf vim.tar
#sleep 1
#cp -r .vim $HOME/
sleep 1
git init
sleep 1
git remote add origin https://github.com/i3wm/vim
sleep 1
git pull origin master
sleep 1
printf '\nInstalling configs . . .\n'
sleep 1
tar -xvf vim.tar
sleep 1
cp -r .vim .vimrc $HOME
#sleep 1
#printf '\nUpdating vundle . . .\n'
#sleep 1
vim -c VundleUpdate -c quitall

# Restore xinitrc
sleep 1
printf '\nDownloading xinitrc . . .\n'
sleep 1
mkdir -p /tmp/xinitrc && cd /tmp/xinitrc
sleep 1
git init
sleep 1
git remote add origin https://github.com/i3wm/scripts
sleep 1
git pull origin master
sleep 1
printf '\nInstalling configs . . .\n'
sleep 1
cd system
sleep 1
cp -r .xinitrc $HOME

# Restore zshrc
sleep 1
printf '\nDownloading zshrc . . .\n'
sleep 1
mkdir -p /tmp/zshrc && cd /tmp/zshrc
sleep 1
git init
sleep 1
git remote add origin https://github.com/i3wm/zsh
sleep 1
git pull origin master
sleep 1
printf '\nInstalling configs . . .\n'
sleep 1
cp -r .zshrc $HOME

# Restore Xresources
sleep 1
printf '\nDownloading Xresources . . .\n'
sleep 1
mkdir -p /tmp/urxvt && cd /tmp/urxvt
sleep 1
git init
sleep 1
git remote add origin https://github.com/i3wm/urxvt
sleep 1
git pull origin master
sleep 1
printf '\nInstalling configs . . .\n'
sleep 1
cp -r .Xresources $HOME

# Reboot system
sleep 1
printf '\nRebooting the system . . .\n'
sleep 1
systemctl reboot

