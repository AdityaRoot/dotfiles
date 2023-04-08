#!/bin/sh
if ! pgrep -x 'pa-applet' > /dev/null
then
    pa-applet --disable-notifications &
fi
picom &
$HOME/.fehbg
blueman-applet &
nm-applet &
xset r rate 300 50 &
# oneko -tofocus &
# oneko-restore-cursor &
pactl load-module module-bluetooth-discover #fixes bluetooth shit
#xfce4-power-manager &
xbindkeys
