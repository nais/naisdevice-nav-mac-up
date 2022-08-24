#!/bin/bash

cat <<'NAISDEVICE'
          o         |           o          
,---.,---..,---.,---|,---..    ,.,---.,---.
|   |,---||`---.|   ||---' \  / ||    |---'
`   '`---^``---'`---'`---'  `'  ``---'`---'

NAISDEVICE

cd "$(dirname "$0")"|| exit

exec &> >(tee -a ~/Library/Logs/naisdevice-nav-mac-up.log)

source scripts/root-test.sh

# sudo prompt
echo "Let's make ready for sudo-ing"
sudo echo "Elevation achieved"

source scripts/add-root-certs.sh
source scripts/nav-webapps.sh
source scripts/chrome.sh
source add-personal-taps.sh
source scripts/brew.sh

exit 0
