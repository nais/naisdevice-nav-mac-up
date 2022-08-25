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
source add-root-certs.sh
source nav-webapps.sh
source brew.sh
source chrome.sh

#if [[ "${clone_target}" != "" ]];then 
#source dotfiles.sh
#fi
exit 0
