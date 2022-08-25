#!/bin/bash
# shellcheck disable=SC2154

source pashua.sh

conf="
# Set window title
*.title = Add your taps

brewtxt.type = text
brewtxt.default = Homebrew is a package manager for macOS.[return]Enter your comma seperated \"taps\", and they will be installed for you.[return][return]Example: python3,wget,fzf
brewtxt.height = 276
brewtxt.width = 310

personal_taps.type = textfield
personal_taps.label = Enter your taps
personal_taps.default = 
personal_taps.width = 310
personal_taps.tooltip = Enter brew taps you want to install. Example: wget,nmap,python3

cb.type = cancelbutton
cb.label = Cancel

db.type = defaultbutton
db.label = Brew it!
"
conf="$conf
          img.type = image
          img.x = 105
          img.y = 200
          img.maxwidth = 100
          img.tooltip = Cheers!
          img.path = ../Resources/brew.png"
pashua_run "$conf" ../Pashua

personaltaps=$(echo "$personal_taps" | tr "," " ")

echo "$personal_taps" >> vars

echo "Will install following taps: $personaltaps"
