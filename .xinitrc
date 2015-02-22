[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xset m 0 0
urxvtd &
setxkbmap -option 'ctrl:swapcaps'
exec xmonad
