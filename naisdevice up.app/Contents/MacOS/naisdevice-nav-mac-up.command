#!/bin/bash

cd "$(dirname "$0")"|| exit

exec &> >(tee -a ~/Library/Logs/naisdevice-nav-mac-up.log)


source scaffolding/vars

source scaffolding/root-test.sh
source scaffolding/rocket.sh

# sudo prompt
echo "\
---------------------------------------------
Let's make ready for sudo-ing
---------------------------------------------"

sudo echo "\
---------------------------------------------
Elevation achieved
---------------------------------------------"
#afplay ../Resources/elevator.mp3 &
#killmusic="$!"
source scaffolding/add-root-certs.sh
source scaffolding/nav-webapps.sh
source scaffolding/brew.sh
source scaffolding/chrome.sh
source scaffolding/install-office.sh

echo "\
---------------------------------------------
Cleaning up
---------------------------------------------"

rm -rf vars
rm -rf taps

cat <<'NAISDEVICE'
_____________________________________________
          o         |           o          
,---.,---..,---.,---|,---..    ,.,---.,---.
|   |,---||`---.|   ||---' \  / ||    |---'
`   '`---^``---'`---'`---'  `'  ``---'`---'
---------------------------------------------
---------------------------------------------
NAISDEVICE

#kill "$killmusic"

exit 0
