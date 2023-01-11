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
```

# create autostart
```sh
# CREATE AUTOSTART SCRIPT
sudo mkdir ~/.config/openbox

nano ~/.config/openbox/autostart
```

# fill in autostart
```sh
# ADD THIS TO THE FILE:
# Note: you NEEDan '&' after each command

feh --bg-scale /path/to/your/background/image.jpg &

unclutter -idle 0 &

chromium --kiosk ~/store.html
```

# create store.html
```sh

nano ~/store.html

```

```html
<html>
<body>
<iframe src='http://rnbjwtzwekbkqgg4vtox5vpp5t3vhx4o2xatknie76bfyv5ecewpm7ad.local/apps/3AtHKALrXrjx2DWejNyCByEL9C2a/pos' style='max-width: 100%; border: 0;'></iframe>
</body>
</html>
```


actually this:

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="style.css">
    <style type="text/css">
            body, html
            {
                margin: 0; padding: 0; height: 100%; overflow: hidden;
            }
        </style>

  </head>
  <body>
    <iframe src='https://rnbjwtzwekbkqgg4vtox5vpp5t3vhx4o2xatknie76bfyv5ecewpm7ad.local/apps/3AtHKALrXrjx2DWejNyCByEL9C2a/pos'
    style="
      position: fixed;
      top: 0px;
      bottom: 0px;
      right: 0px;
      width: 100%;
      border: none;
      margin: 0;
      padding: 0;
      overflow: hidden;
      z-index: 999999;
      height: 100%;">
      </iframe>
  </body>
</html>

```