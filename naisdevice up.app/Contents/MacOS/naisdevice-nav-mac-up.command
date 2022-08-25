#!/bin/bash



cat <<'NAISDEVICE'
          o         |           o          
,---.,---..,---.,---|,---..    ,.,---.,---.
|   |,---||`---.|   ||---' \  / ||    |---'
`   '`---^``---'`---'`---'  `'  ``---'`---'

NAISDEVICE

cd "$(dirname "$0")"|| exit

exec &> >(tee -a ~/Library/Logs/naisdevice-nav-mac-up.log)

source vars

source root-test.sh

# sudo prompt
echo "Let's make ready for sudo-ing"
sudo echo "Elevation achieved"
source scaffolding/add-root-certs.sh
source scaffolding/nav-webapps.sh
source scaffolding/brew.sh
source scaffolding/chrome.sh

#rm -rf vars
#if [[ "${clone_target}" != "" ]];then 
#source dotfiles.sh
#fi
exit 0
