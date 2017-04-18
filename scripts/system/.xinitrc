#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# User specified applications

# Disable click on single tap
/usr/bin/bash $HOME/scripts/system/tap-touchpad.sh & disown

# Launch network-manager-applet
/usr/bin/nm-applet & disown

# Wallpaper
/usr/bin/feh --bg-scale $HOME/Pictures/Wallpaper/rAXHzK.jpg & disown

# Clipboard-manager
/usr/bin/parcellite & disown

# For mounting drives in thunar without root
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown

# Launch compositing manager
/usr/bin/compton --config $HOME/.config/i3/compton.conf -b & disown

# TO-DO conky
/usr/bin/sleep 10 && /usr/bin/nice 19 $(/usr/bin/conky -d -c $HOME/.conky/.conkyrc) & disown

# Main conky
/usr/bin/sleep 20 && /usr/bin/nice 19 $(/usr/bin/conky -d -c $HOME/.conky/noobslab/.conkyrc) & disown

# Finally launch window-manager
exec i3
