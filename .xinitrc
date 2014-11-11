[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
xset m 0 0
urxvtd &
emacs --daemon &
setxkbmap -option 'ctrl:swapcaps'
exec awesome
