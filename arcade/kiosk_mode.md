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
feh --bg-scale ~/wallpaper.jpg &

unclutter -idle 2 &

flatpak run com.snes9x.Snes9x sf2.zip &
```
