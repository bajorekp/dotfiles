#!/bin/bash

cd ~/Downloads

# Installs powerline patched Mac font
if ! find ~/Library/Fonts -name 'SF-Mono-Powerline*.otf' | grep -q '.'; then
  wget https://github.com/Twixes/SF-Mono-Powerline/archive/refs/heads/master.zip
  unzip master.zip
  cp -v SF-Mono-Powerline-master/SF-Mono-Powerline-*.otf ~/Library/Fonts
  rm -rf SF-Mono-Powerline-master master.zip
fi

if ! find ~/Library/Fonts -name 'SFMono*.otf' | grep -q '.'; then
  wget https://github.com/epk/SF-Mono-Nerd-Font/archive/refs/heads/master.zip
  unzip master.zip
  cp -v SF-Mono-Nerd-Font-master/SFMono*.otf ~/Library/Fonts
  rm -rf SF-Mono-Nerd-Font-master master.zip
fi
