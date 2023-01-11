https://www.willhaley.com/blog/debian-fullscreen-gui-kiosk/
https://wiki.debian.org/Openbox#Obmenu
https://unix.stackexchange.com/questions/30207/debian-based-system-only-one-gui-program-nothing-else


```sh
useradd -m kiosk-user
apt-get update

# INSTALL WHAT YOU'LL NEED
apt-get install sudo xorg chromium openbox lightdm feh unclutter --yes

# ENABLE AUTO LOGIN
# sudo /usr/lib/lightdm/lightdm-set-defaults --autologin "kiosk-user"
sudo cat << EOF > /etc/lightdm/lightdm.conf
[SeatDefaults]
autologin-user=kiosk-user
user-session=openbox
#autologin-user-timeout=0
EOF


# CREATE AUTOSTART SCRIPT
sudo mkdir ~/.config/openbox

nano ~/.config/openbox/autostart

# ADD THIS TO THE FILE:
feh --bg-scale /path/to/your/background/image.jpg

unclutter -idle 0
```
