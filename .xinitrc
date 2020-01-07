#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
# userwallp=$HOME/.wallp (commentato perché ho settato il wallpaper dal config di i3)
# decommentare se di vuole uno sfondo diverso per le finester di rxvt
# decommentare anche l'if più sotto

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
	xrdb -merge $userresources
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login

# Modifica di Enrico per lanciare i3 ed avere il layout della tastiera in ita
# la stessa riga si può mettere anche in .confiug/i3/config con exec --no-startup-id
# lanciamo xwallpaper con lo sforndo desiderato.
#xwallpaper --daemon --stretch /home/enrico/Immagini/Wallpapers/baby-arch1920x1080.jpg
#xwallpaper --daemon --stretch $test


# if [ -f "$userwallp" ]; then
# 	xwallpaper --daemon --stretch $userwallp
# fi

setxkbmap it &
exec i3
