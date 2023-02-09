# TODO: use exec?
alias launchgame="DISPLAY=:0 flatpak run com.snes9x.Snes9x ~/roms/sf2.zip"
alias killgame=" kill $(ps -e | grep 'snes9x' | awk '{print $1}')"
alias listgames="ls -1 ~/roms | grep .zip | sed 's/.zip//g'"

# alias play="DISPLAY=:0 flatpak run com.snes9x.Snes9x ~roms/$1.zip"

# function play() {
#     echo Playing ~/roms/"$1"
#     DISPLAY=:0 flatpak run com.snes9x.Snes9x ~/roms/"$1".zip
# }
