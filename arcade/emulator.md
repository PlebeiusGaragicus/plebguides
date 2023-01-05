https://flatpak.org/setup/Debian

```sh
apt update
apt install flatpak
apt install gnome-software-plugin-flatpak # AM I RUNNING ON GNOME?
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.snes9x.Snes9x
```

# RUN THE EMULATOR
```sh
flatpak run com.snes9x.Snes9x <ROM>
```

- how to run fullscreen - does it auto fullscreen if you run with game?
- Try RetroArch

