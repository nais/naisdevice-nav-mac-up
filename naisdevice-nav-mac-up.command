#!/bin/bash

cat <<'NAISDEVICE'
          o         |           o          
,---.,---..,---.,---|,---..    ,.,---.,---.
|   |,---||`---.|   ||---' \  / ||    |---'
`   '`---^``---'`---'`---'  `'  ``---'`---'

NAISDEVICE

cd "$(dirname "$(readlink -f "$0")")" || exit

exec &> >(tee -a ~/Library/Logs/naisdevice-nav-mac-up.log)

source scripts/root-test.sh

cat <<'USAGE' 
"Usage: this script will install the bare essentials
for a developer mac @NAV. Chrome if you want it, homebrew
and naisdevice - or you can just quit now and do it manually.
([ctrl]+[C])

Any brew package that you already know you want should be 
added to the file "personal-taps". 

There a several steps that require `sudo` but the script must not/
will not run as root. In the case of the initial `sudo` authorisation 
timing out you might be prompted for sudo again before completion.

Several certificates will also be installed as well as a shortcut
in your dock where you will find links to internal web apps.

Any questions you might have can be directed to the #naisdevice
channel on Slack.
USAGE

# sudo prompt
echo "Let's make ready for sudo-ing"
sudo echo "Elevation achieved"

# Offer Chrome
source scripts/chrome.sh

# Offer Homebrew and install some stuff
source scripts/brew.sh

# Copy ".webloc file to disk and add to Dock"
source scripts/nav-webapps.sh

# Add all root-certs
source scripts/add-root-certs.sh

cat <<'NEXTSTEP' 
Slack will now open.
Log on with your NAV credentials and when logged in
paste the following command in any message input field:
`/msg @Kolide installers`

Also.. you should reboot sometime soon. Stuff will work smoother that way.
GLHF
NEXTSTEP

sleep 5

open -a "Slack"

exit 0
