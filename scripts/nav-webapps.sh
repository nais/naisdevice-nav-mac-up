#!/bin/bash

user=$(whoami)


echo "WEBAPPS ########  $PWD"
cat <<'WEBAPPS' 
NAV WebApps shortcut has been added to ~/Documents.
Keep in mind that enrollment must be complete before you
are granted access to many of the apps that are featured 
there.
WEBAPPS

mv ../stuff/nav-webapps.webloc /Users/"$user"/Documents/nav-webapps.webloc

defaults write com.apple.dock persistent-others -array-add \
"<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:////Users/"$user"/Documents/nav-webapps.webloc</string><key>_CFURLStringType</key><integer>15</integer></dict><key>file-type</key><integer>32</integer></dict><key>tile-type</key><string>file-tile</string></dict>"
killall Dock

sleep 5