#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC1091

source pashua.sh

conf="
# Set window title
*.title = MS Office Packages

mstxt.type = text
mstxt.default = NAV beyond the IT department very much a Microsoft shop. Select the packages you think you might need.[return]Keep in mind that these are large packages and will take som time to download & install[return]The quickest and easiest way to fetch anything you might need later is by browsing to:[return]https:/macadmins.software 
mstxt.height = 276
mstxt.width = 310

teams.type = checkbox
teams.label = Teams
teams.default = 0
teams.disabled = 0
teams.rely = -10

outlook.type = checkbox
outlook.label = Outlook
outlook.default = 0
outlook.disabled = 0
outlook.rely = -10

excel.type = checkbox
excel.label = Excel
excel.default = 0
excel.disabled = 0
excel.rely = -10

word.type = checkbox
word.label = Word
word.default = 0
word.disabled = 0
word.rely = -10

pp.type = checkbox
pp.label = PowerPoint
pp.default = 0
pp.disabled = 0
pp.rely = -10

rdp.type = checkbox
rdp.label = Remote Desktop
rdp.default = 0
rdp.disabled = 0
rdp.rely = -10

onedrive.type = checkbox
onedrive.label = OneDrive
onedrive.default = 0
onedrive.disabled = 0
onedrive.rely = -10

cb.type = cancelbutton
cb.label = Cancel

db.type = defaultbutton
db.label = Install!
"
conf="$conf
          img.type = image
          img.x = 170
          img.y = 85
          img.maxwidth = 100
          img.tooltip = Cheers!
          img.path = ../Resources/suite.png"
pashua_run "$conf" ../Pashua

if [[ "$teams" = "1" ]]; then
    echo -n "teams " >>mspkgs
fi
if [[ "$outlook" = "1" ]]; then
    echo -n "outlook " >>mspkgs
fi
if [[ "$excel" = "1" ]]; then
    echo -n "excel " >>mspkgs
fi
if [[ "$word" = "1" ]]; then
    echo -n "word " >>mspkgs
fi
if [[ "$pp" = "1" ]]; then
    echo -n "pp " >>mspkgs
fi
if [[ "$rdp" = "1" ]]; then
    echo -n "rdp " >>mspkgs
fi
if [[ "$onedrive" = "1" ]]; then
    echo -n "onedrive " >>mspkgs
fi

ms_array=$(cat mspkgs)

echo -n "pkgs=( $ms_array )" >mspkgs
