alias y='yaourt'
alias p='pacman'
alias bu='rsync -av --force --delete'
alias :q='exit'
alias em='emacsclient -nw'

# Make directory and change into it.
function mcd() {
  mkdir -p "$1" && cd "$1";
}

function storamount() {
  sudo mkdir /mnt/stora
  sudo mount -o "vers=3" -o nolock 192.168.1.2:/home/0common/ /mnt/stora/
}

function mirrorupdate() {
  rm /etc/pacman.d/mirrorlist
  wget -O /etc/pacman.d/_mirrorlist http://www.archlinux.org/mirrorlist/all/
  sed '/^#\S/ s|#||' -i /etc/pacman.d/_mirrorlist
  sed 's/$arch/x86_64/g' -i /etc/pacman.d/_mirrorlist
  rankmirrors -n 10 /etc/pacman.d/_mirrorlist > /etc/pacman.d/mirrorlist
  rm /etc/pacman.d/_mirrorlist
}

function randombg() {
  find ~/.wallpapers/*.* | shuf -n 1 | xargs feh --bg-scale
}

function eclipse() {
  cd ~/app/eclipse
  ./eclipse -vmargs -Xmx2048M
}

function xinit-ext() {
  xinit `which $1` -- :1 -xf86config xorg-ext.conf
}

function xinit-laptop() {
  xinit `which $1` -- :1 -xf86config xorg-laptop.conf
}

function xinit-big() {
  xinit `which $1` -- :1 -xf86config xorg-big.conf
}

function xinit-big-ru() {
  xinit `which $1` -- :1 -xf86config xorg-big-ru.conf
}

function post() {
  cd /home/axyz/www/axyz.github.io/_posts
  date=$(date +'%Y-%m-%d')
  name="$date-$1.markdown"
  touch $name
  echo '---\nlayout: post\ntitle: "'$(echo $1 | sed -e "s/-/ /g")'"\ndate: '$date'\ncategories: '$(echo $2 | sed -e "s/,/ /g")'\n---\n\n' > $name 
  vim $name
} 
