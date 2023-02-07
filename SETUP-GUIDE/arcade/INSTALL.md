# SETUP

# add ```/sbin``` to ```$PATH```
 
```sh
# single quotes prevent variable expansion
sudo echo 'export PATH="/sbin:$PATH"' >> ~/.bashrc
```

## download assets

```sh
wget https://github.com/PlebeiusGaragicus/PlebGuides/raw/main/assets/wp1.jpg
#wget https://github.com/PlebeiusGaragicus/PlebGuides/raw/main/assets/wp2.jpg
#wget https://github.com/PlebeiusGaragicus/PlebGuides/raw/main/assets/wp3.jpg
```

# install the SNES emulator (and additional software, as needed)

 - https://flatpak.org/setup/Debian

```sh
# RUN TOGETHER
sudo apt update
sudo apt-get install flatpak
sudo apt-get install gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# need to answer "y" to the following, twice:
sudo flatpak install flathub com.snes9x.Snes9x

sudo reboot

# verify install of SNES emulator
which flapack
# EXPECT: /usr/bin/flatpak
```

## HOW TO RUN EMULATOR

```sh
flatpak run com.snes9x.Snes9x <ROM>
```

# enable the "kiosk" mode

```sh
# ensure we have useradd
export PATH=$PATH:/usr/sbin
```

 - https://www.willhaley.com/blog/debian-fullscreen-gui-kiosk/
 - https://wiki.debian.org/Openbox#Obmenu
 - https://unix.stackexchange.com/questions/30207/debian-based-system-only-one-gui-program-nothing-else

```sh
sudo useradd -m kiosk-user
sudo apt-get update

# INSTALL WHAT YOU'LL NEED
# NOTE: I SELECTED lightgm DURING INSTALLATION!
sudo apt-get install xorg chromium openbox lightdm feh unclutter --yes


# ENABLE AUTO LOGIN
# sudo /usr/lib/lightdm/lightdm-set-defaults --autologin "kiosk-user"
#sudo cat << EOF > /etc/lightdm/lightdm.conf
sudo nano /etc/lightdm/lightdm.conf

# CONTENTS:
[SeatDefaults]
autologin-user=satoshi
user-session=openbox
autologin-user-timeout=0
```

# create autostart
```sh
# CREATE AUTOSTART SCRIPT
sudo mkdir ~/.config/openbox

sudo nano ~/.config/openbox/autostart

# CONTENTS:
# Note: you NEED a '&' after each command

feh --bg-scale ~/wp1.jpg &

unclutter -idle 2 &

flatpak run com.snes9x.Snes9x sf2.zip &
#chromium --kiosk ~/store.html

```

# copy the ROMs

```sh
# DO THIS ON YOUR LAPTOP
scp -r ~/ROMs/ user@hosename.local:/home/satoshi/
```

# reboot to test it out

```sh
sudo reboot
```

# manually change settings when it reboots and loads!

schweeee!