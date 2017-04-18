#!/bin/bash

# Declaring variables. Change accordingly
dir=$HOME/tsmjdhf

# Check the wireless device name with the command `iwconfig`
printf '\nPLEASE MODIFY THE VARIABLES IN THE SCRIPT ACCORDINGLY AND THEN RE-RUN THE SCRIPT.\n'
read -p 'Continue? (y/n): ' choice
case "$choice" in
	y* | Y*) gtr=1;;
	*) exit;;
esac

# Release variable
unset gtr
unset choice

# Restoring configuration if existed
sleep 1
if [[ -d $dir/i3 ]]; then
	mkdir -p $HOME/.config
	cp -r $dir/i3 $HOME/.config
fi
	
sleep 1
if [[ -d $dir/dunst ]]; then
	cp -r $dir/dunst $HOME/.config
fi
	
sleep 1
if [[ -d $dir/rofi ]]; then
	mkdir -p $HOME/.local
	cp -r $dir/rofi $HOME/.local
fi
	
sleep 1
if [[ -d $dir/.conky ]]; then
	cp -r $dir/.conky $HOME
fi
	
sleep 1
if [[ -d $dir/.vim ]]; then
	cp -r $dir/.vim $HOME
fi
	
sleep 1
if [[ -f $dir/.vimrc ]]; then
	cp -r $dir/.Xresources $dir/.vimrc $dir/.zshrc $dir/.xinitrc $HOME
fi

exit 0
