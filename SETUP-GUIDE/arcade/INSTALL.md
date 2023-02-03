# SETUP

## setup reboot, shutdown

 - https://superuser.com/questions/1462581/unable-to-shutdown-reboot-my-debian-10-server

### systemctl reboot
```sh
# sudo cat << EOF > /bin/reboot
sudo nano /bin/reboot

# ENTER THIS
#!/bin/bash
sudo systemctl reboot

# THEN RUN THIS
sudo chmod +x /bin/reboot
```

### systemctl poweroff
```sh
sudo nano /bin/shutdown
#sudo cat << EOF > /bin/shutdown
#!/bin/bash
sudo systemctl poweroff
EOF
sudo chmod +x /bin/shutdown
```

## download assets

```sh
wget https://github.com/PlebeiusGaragicus/PlebGuides/raw/main/assets/wp1.jpg
wget https://github.com/PlebeiusGaragicus/PlebGuides/raw/main/assets/wp2.jpg
wget https://github.com/PlebeiusGaragicus/PlebGuides/raw/main/assets/wp3.jpg
```

# install the SNES emulator (and additional software, as needed)

 - https://flatpak.org/setup/Debian

```sh
sudo apt update
# TODO - IS THIS NEEDED...? AM I EVEN RUNNING GNOME?  WHAT IS MY SOFTWARE THE DEBIAN DEFAULTS TO????
sudo apt-get install flatpak
sudo apt-get install gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub com.snes9x.Snes9x
```

## verify install of SNES emulator

```sh
# RUN ON ARCADE:
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

feh --bg-scale ~/wp3.jpg &

unclutter -idle 0 &

flatpak run com.snes9x.Snes9x sf2.zip &
#chromium --kiosk ~/store.html

```
