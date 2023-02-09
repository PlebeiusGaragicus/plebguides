# DOWNLOAD ASSETS (BACKGROUND, ETC.)

```sh
wget https://github.com/PlebeiusGaragicus/PlebGuides/raw/main/arcade/wallpaper.jpg
```

# ENABLE 'KIOSK' MODE AND AUTO-LOGIN

 - https://www.willhaley.com/blog/debian-fullscreen-gui-kiosk/
 - https://wiki.debian.org/Openbox#Obmenu
 - https://unix.stackexchange.com/questions/30207/debian-based-system-only-one-gui-program-nothing-else

```sh
# you can add a user for this, or just use 'main' user
# sudo useradd -m kiosk-user
sudo apt-get update

# NOTE: I SELECTED lightgm DURING INSTALLATION!
sudo apt-get install \
    xorg \
    chromium \
    openbox \
    lightdm \
    feh \
    unclutter \
    --yes


# ENABLE AUTO LOGIN
# sudo /usr/lib/lightdm/lightdm-set-defaults --autologin "kiosk-user"
sudo nano /etc/lightdm/lightdm.conf
```

## lightdm.conf contents:
```sh
# CONTENTS:
[SeatDefaults]
autologin-user=satoshi
user-session=openbox
autologin-user-timeout=0
```

# CREATE AUTOSTART SCRIPT
```sh
# CREATE AUTOSTART SCRIPT
sudo mkdir ~/.config/openbox

sudo nano ~/.config/openbox/autostart

```

## autostart contents:
```sh
# CONTENTS:
# Note: you NEED a '&' after each command

# disable screensaver
xset dpms 0 0 0 && xset s noblank  && xset s off &

# set background
feh --bg-scale ~/wallpaper.jpg &

# hide mouse cursor
unclutter -idle 2 &

flatpak run com.snes9x.Snes9x ~/roms/sf2.zip &
```

# INSTALL BOOT SPLASH SCREEN

# THIS DOES NOT WORK YET!!!

 - https://www.freedesktop.org/wiki/Software/Plymouth/
 - https://wiki.debian.org/plymouth

```sh
sudo apt-get install plymouth plymouth-themes --yes

# to list themes:
plymouth-set-default-theme -l
# to set theme:
sudo plymouth-set-default-theme -R <THEME>
```



# DISABLE GRUB MENU
```sh
sudo nano /etc/default/grub
```

## grub contents:
```sh
# CONTENTS:
...
GRUB_TIMEOUT=0
GRUB_TIMEOUT_STYLE=hidden
...
GRUB_CMDLINE_LINUX_DEFAULT="splash quiet persistent"
...
# UNCOMMENT this line and set to your screen resolution
# you can find this by running 'xdpyinfo' in a terminal, eg:
# DISPLAY=:0 xdpyinfo | awk '/dimensions/{print $2}'
GRUB_GFXMODE=1920x1080
```


# TODO: firmware problems...

 - https://wiki.debian.org/AtiHowTo
