# INSTALL

 - see: https://flatpak.org/setup/Debian

```sh
# RUN TOGETHER
sudo apt update
sudo apt-get install flatpak
sudo apt-get install gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# need to answer "y" to the following, twice:
sudo flatpak install flathub com.snes9x.Snes9x

# this is needed
sudo reboot

# verify install of SNES emulator
which flapack
# EXPECT: /usr/bin/flatpak
```

# HOW TO RUN

```sh
flatpak run com.snes9x.Snes9x <ROM>
```

# CONFIG FILE

located ```~/.var/app/com.snes9x.Snes9x/config/snes9x/snes9x.conf```

```sh
cp ./snes9x.conf ~/.var/app/com.snes9x.Snes9x/config/snes9x/snes9x.conf
```

# COPY ROMs

```sh
# DO THIS ON YOUR LAPTOP
scp -r ~/ROMs/ user@hosename.local:/home/satoshi/
```
