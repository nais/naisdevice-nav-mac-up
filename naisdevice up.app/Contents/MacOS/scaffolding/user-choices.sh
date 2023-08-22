#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC1091
# shellcheck disable=SC1111

source pashua.sh

conf="
# Set window title
*.title = naisdevice up

txt.type = text
txt.default = \"naisdevice up\" is a simple utility to get you started setting up you developer workstation. Homebrew will be installed, as well as a few apps you are going to need. Other features are optional. ROOT certificates will also be added.[return](NOTE: A terminal will open an there are several steps that require user interaction)
txt.height = 276
txt.width = 310
txt.x = 0
txt.y = 200

# User choices
homebrew.type = checkbox
homebrew.label = Homebrew
homebrew.default = 1
homebrew.disabled = 1
homebrew.rely = -10

roots.type = checkbox
roots.label = NAV & NAIS ROOT Certs
roots.default = 1
roots.disabled = 1
roots.rely = -10

webapps.type = checkbox
webapps.label = NAV Webapps
webapps.default = 1
webapps.disabled = 1
webapps.rely = -10

chrome_install.type = checkbox
chrome_install.label = Google Chrome
chrome_install.default = 0
chrome_install.rely = -10

brew.type = checkbox
brew.label = Add Brew taps
brew.rely = -10
brew.default = 0

msoffice.type = checkbox
msoffice.label = MS Office Stuff
msoffice.default = 0
msoffice.disabled = 0
msoffice.rely = -10

db.type = defaultbutton
db.label = Lets' go!

cb.type = cancelbutton
cb.label = Cancel
"

conf="$conf
          img.type = image
          img.x = 90
          img.y = 330
          img.maxwidth = 100
          img.tooltip = This is an element of type “image”
          img.path = ../Resources/naisdevice-up.png"

pashua_run "$conf"

if [[ "$cb" = "1" ]]; then
    exit 0
fi

echo brew="$brew" >> vars
echo chrome_install="$chrome_install" >> vars

#echo repo="$repo" >> vars

## TODO: Maybe? Add "clone some repo"
## repo.type = checkbox
## repo.label = Clone git repo
## repo.default = 0
## repo.rely = -10