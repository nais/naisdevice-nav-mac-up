#!/bin/bash -x

if [[ ! -f "$HOME/Documents/nav-webapps.webloc" ]]; then

    cat <<'WEBAPPS'
---------------------------------------------------------
NAV WebApps shortcut has been added to ~/Documents and to
your Dock.
Keep in mind that enrollment must be complete before you
are granted access to many of the apps that are featured 
there.
---------------------------------------------------------"
WEBAPPS

    cp scaffolding/nav-webapps.webloc "$HOME"/Documents/
    SetFile -a C "$HOME"/Documents/nav-webapps.webloc
    Rez -append ../Resources/icon.rsrc -o "$HOME"/Documents/nav-webapps.webloc

    defaults write com.apple.dock persistent-others -array-add \
        "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>file:////$HOME/Documents/nav-webapps.webloc</string><key>_CFURLStringType</key><integer>15</integer></dict><key>file-type</key><integer>32</integer></dict><key>tile-type</key><string>file-tile</string></dict>"
    killall Dock

    sleep 3
fi
