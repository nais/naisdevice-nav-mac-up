#!/bin/bash

cd "$(dirname "$0")"|| exit

exec &> >(tee -a ~/Library/Logs/naisdevice-nav-mac-up.log)

source vars

source scaffolding/root-test.sh
source scaffolding/rocket.sh

# sudo prompt
echo "\
*********************************************
Let's make ready for sudo-ing
---------------------------------------------"

sudo echo "\
*********************************************
Elevation achieved
---------------------------------------------"

source scaffolding/add-root-certs.sh
source scaffolding/nav-webapps.sh
source scaffolding/brew.sh
source scaffolding/chrome.sh

echo "\
*********************************************
Cleaning up
---------------------------------------------"

rm -rf vars
rm -rf taps

#if [[ "${clone_target}" != "" ]];then 
#source dotfiles.sh
#fi

cat <<'NAISDEVICE'
_____________________________________________
          o         |           o          
,---.,---..,---.,---|,---..    ,.,---.,---.
|   |,---||`---.|   ||---' \  / ||    |---'
`   '`---^``---'`---'`---'  `'  ``---'`---'
---------------------------------------------
---------------------------------------------"
NAISDEVICE

exit 0
