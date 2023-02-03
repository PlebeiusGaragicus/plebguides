https://learn.adafruit.com/setting-up-a-raspberry-pi-as-a-wifi-access-point/install-software

# see your wifi-thangs
```
ifconfig -a
```

# see if your wifi-thang can do AP mode
```
iw list | grep "Supported interface modes" -A 8
```

# install and always say YES
```
sudo apt-get update
sudo apt-get install hostapd isc-dhcp-server iptables-persistent -y
```

# make 3 edits
```
sudo nano /etc/dhcp/dhcpd.conf
```

# 1 comment out these lines with a '#'
```
option domain-name "example.org";
option domain-name-servers ns1.example.org, ns2.example.org;
```

# 2 remove '#' before '#authoritative'
```
# If this DHCP server is the official DHCP server for the local
# network, the authoritative directive should be uncommented.
#authoritative;
```

# 3 scroll to bottom and add:
```
subnet 192.168.42.0 netmask 255.255.255.0 {
	range 192.168.42.10 192.168.42.50;
	option broadcast-address 192.168.42.255;
	option routers 192.168.42.1;
	default-lease-time 600;
	max-lease-time 7200;
	option domain-name "local";
	option domain-name-servers 8.8.8.8, 8.8.4.4;
}
```

# edit this
```
sudo nano /etc/default/isc-dhcp-server
```

INTERFACES="" --> INTERFACES="wlan0"

(or use whatever interface that's talking to the internet)

if you find INTERFACESv4 or INTERFACESv6.. then add to BOTH

# Set up wlan0 for static IP

then..?
```
sudo ifdown wlan0
```

# and...
```
sudo nano /etc/network/interfaces
```

comment out this:
```
auto wlan0
```

... and in front of every line afterwards. If you don't have that line, just make sure it looks like the screenshot below in the end! Basically just remove any old wlan0 configuration settings, we'll be changing them up

add:
```
iface wlan0 inet static
  address 192.168.42.1
  netmask 255.255.255.0
```

# Assign a static IP address to the wifi adapter by running:
```
sudo ifconfig wlan0 192.168.42.1
```


# Configure Access Point

We will set up a password-protected network so only people with the password can connect.

Create a new file by running:
```
sudo nano /etc/hostapd/hostapd.conf
```

Paste the following in, you can change the text after ssid= to another name, that will be the network broadcast name. The password can be changed with the text after wpa_passphrase=

!!!! Make sure each line has no extra spaces or tabs at the end or beginning - this file is pretty picky!

... driver=rtl871xdrv no WORKY

THE INTERFACE HERE IS THE ONE YOU PICK TO BE THE NEW NETWORK

```
interface=wlan1
driver=nl80211
ssid=bigsubwooferAP
country_code=US
hw_mode=g
channel=6
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=snoopdogg
wpa_key_mgmt=WPA-PSK
wpa_pairwise=CCMP
wpa_group_rekey=86400
ieee80211n=1
wme_enabled=1
```

Note: If you are not using the Adafruit wifi adapters, you may have to change the driver=rtl871xdrv to say driver=nl80211 or something

# Now we will tell the Pi where to find this configuration file
```
sudo nano /etc/default/hostapd
```

# Find the line #DAEMON_CONF="" and edit it so it says:
```
DAEMON_CONF="/etc/hostapd/hostapd.conf"
```

Don't forget to remove the # in front to activate it!

Likewise, run
```
sudo nano /etc/init.d/hostapd
```

and find the line
```
DAEMON_CONF=
```

and change it to
```
DAEMON_CONF=/etc/hostapd/hostapd.conf
```

# Configure Network Address Translation

Setting up NAT will allow multiple clients to connect to the WiFi and have all the data 'tunneled' through the single Ethernet IP. (But you should do it even if only one client is going to connect)

```
sudo nano /etc/sysctl.conf
```

Scroll to the bottom and add

```
net.ipv4.ip_forward=1
```

This will start IP forwarding on boot up

```
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
```

...to activate it immediately

Run the following commands to create the network translation between the ethernet port eth0 and the wifi port wlan0

```
sudo iptables -t nat -A POSTROUTING -o wlan1 -j MASQUERADE
sudo iptables -A FORWARD -i wlan1 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o wlan1 -j ACCEPT
```

You can check to see whats in the tables with

```
sudo iptables -t nat -S
sudo iptables -S
```

To make this happen on reboot (so you don't have to type it every time) run:

```
sudo sh -c "iptables-save > /etc/iptables/rules.v4"
```


this fixes an error?
```
sudo systemctl unmask hostapd.service
sudo systemctl enable hostapd.service
```

```
sudo update-rc.d hostapd enable
sudo update-rc.d isc-dhcp-server enable
```


sudo nano /etc/network/interfaces

add

hostapd /etc/hostapd/hostapd.conf