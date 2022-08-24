#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC2034

# Define what the dialog should be like
# Take a look at Pashua's Readme file for more info on the syntax

if [[ "$chk5" = "1" ]];then

source pashua.sh

conf="
# Set window title
*.title = Add your taps

txt.type = text
txt.default = Homebrew is a package manager for macOS.[return]Enter your comma seperated \"taps\", and they will be installed for you.[return][return]Example: python3,wget,fzf
txt.height = 276
txt.width = 310
txt.x = 0
txt.y = 100

tf.type = textfield
tf.label = Enter your taps
tf.default = 
tf.width = 310
tf.tooltip = Enter brew taps you want to install. Example: wget,nmap,npm,python3
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

personaltaps=$(echo "$tf" | tr "," " ")

echo "Will install following taps: $personaltaps"
fi
