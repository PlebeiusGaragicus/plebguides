https://pimylifeup.com/raspberry-pi-on-screen-keyboard/


```sh
sudo apt install matchbox-keyboard

DISPLAY=:0 matchbox-keyboard &
```


sudo nano /usr/bin/toggle-keyboard.sh

##### cat << EOF - uhh.. do this
#!/bin/bash
PID="$(pidof matchbox-keyboard)"
if [  "$PID" != ""  ]; then
  kill $PID
else
 matchbox-keyboard &
fi
EOF

sudo chmod +x /usr/bin/toggle-keyboard.sh

sudo nano /usr/share/raspi-ui-overrides/applications/toggle-keyboard.desktop

# cat << EOF -- and again
[Desktop Entry]
Name=Toggle Virtual Keyboard
Comment=Toggle Virtual Keyboard
Exec=/usr/bin/toggle-keyboard.sh
Type=Application
Icon=matchbox-keyboard.png
Categories=Panel;Utility;MB
X-MB-INPUT-MECHANISM=True
EOF


cp /etc/xdg/lxpanel/LXDE-pi/panels/panel /home/pi/.config/lxpanel/LXDE-pi/panels/panel

nano /home/pi/.config/lxpanel/LXDE-pi/panels/panel

# cat add this
Plugin {
  type=launchbar
  Config {
    Button {
      id=toggle-keyboard.desktop
    }
  }
}
EOF

sudo reboot
