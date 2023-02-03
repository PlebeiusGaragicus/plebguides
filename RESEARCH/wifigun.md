# wpa_supplicant.conf
```
country=us
update_config=1
ctrl_interface=/var/run/wpa_supplicant

network={
 scan_ssid=1
 ssid=""
 psk=""
}
```

```
ifconfig -a

sudo nano /etc/wpa_supplicant/wpa_supplicant.conf

sudo wpa_cli -i wlan0 reconfigure

ping 8.8.8.8 #gewgle
```

If you find your external WiFi adapter kernel module 'drops out' from time to time... Create and edit a new file in /etc/modprobe.d/8192cu.conf

```
sudo nano /etc/modprobe.d/8192cu.conf
```
add: options 8192cu rtw_power_mgnt=0 rtw_enusbss=1 rtw_ips_mode=1

```
sudo reboot
```



BUILD A WIFI GUN

https://www.youtube.com/watch?v=raAtvQLkneg

https://www.youtube.com/watch?v=Nk-nj_BwoBE

https://physicsopenlab.org/2020/10/10/a-simple-11-2-ghz-radiotelescope/

https://www.reddit.com/r/RTLSDR/comments/6o1116/tv_satellite_dish_as_antenna/

