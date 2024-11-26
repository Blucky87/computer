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

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
#exec xrandr --output DP-0 --auto --left-of HDMI-0 --output HDMI-0 --auto --below DP-2
primary_screen="HDMI-4"
left_screen="DP-3"
top_screen="DP-4"
echo "Primary Screen [ $primary_screen ]"
echo "Left Screen [ $left_screen ]"
echo "Right Screen [ $right_screen ]"
echo "Top Screen [ $top_screen ]"

#exec xrandr --output $left_screen --auto --left-of $primary_screen --output $primary_screen --auto --below $top_screen

# 1440p
xrandr --output HDMI-0 --primary --mode 3440x1440 --pos 2560x1080 --rotate normal --output DP-0 --mode 2560x1440 --pos 0x1080 --rotate normal --output DP-2 --mode 1920x1080 --pos 3450x0 --rotate normal

# 4k
 xrandr --output HDMI-0 --primary --mode 3440x1440 --pos 3840x1080 --rotate normal --output DP-0 --mode 3840x2160 --pos 0x602 --rotate normal --output DP-2 --mode 1920x1080 --pos 4646x0 --rotate normal

xrandr --output HDMI-0 --primary --mode 3440x1440 --pos 2560x1080 --rotate normal --output DP-0 --mode 2560x1440 --pos 0x1080 --rotate normal --output DP-2 --mode 1920x1080 --pos 3450x0 --rotate normal


exec i3
