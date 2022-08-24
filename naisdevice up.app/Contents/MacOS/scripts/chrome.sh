#!/bin/bash

chrome-install() {

    if [[ "$chk4" = "1" ]]; then

        echo "Getting latest Chrome stable release..."
        curl -sSO https://dl.google.com/chrome/mac/stable/accept_tos%3Dhttps%253A%252F%252Fwww.google.com%252Fintl%252Fen_ph%252Fchrome%252Fterms%252F%26_and_accept_tos%3Dhttps%253A%252F%252Fpolicies.google.com%252Fterms/googlechrome.pkg

        echo "Installing Chrome..."
        sudo installer -pkg googlechrome.pkg -target /

        wait

        defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
        killall Dock

        rm -rf googlechrome.pkg

    else

        echo "Skipping Chrome install.."

    fi

}
chrome-install
