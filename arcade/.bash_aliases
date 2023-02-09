# TODO: use exec?
alias launchgame="DISPLAY=:0 flatpak run com.snes9x.Snes9x sf2.zip"
alias killgame=" kill $(ps -e | grep 'snes9x' | awk '{print $1}')"

