if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Xresources
xrdb -merge ~/.Xresources

# Monitors
xrandr --output DFP1 --primary
xrandr --output DFP2 --right-of DFP1

# Startups
xscreensaver -no-splash &
#dropboxd &
#bluedevil-monolithic &
xset b off
eval $(cat ~/.fehbg)
xmodmap -e 'clear Lock'
xmodmap -e 'keycode 0x42=Escape'

exec i3
