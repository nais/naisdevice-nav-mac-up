#!/bin/bash
# shellcheck disable=SC2154

chrome-install() {

    if [[ "$chrome_install" = "1" ]]; then

echo "\
---------------------------------------------
Getting latest Chrome stable release...
---------------------------------------------"
curl -O https://dl.google.com/chrome/mac/stable/accept_tos%3Dhttps%253A%252F%252Fwww.google.com%252Fintl%252Fen_ph%252Fchrome%252Fterms%252F%26_and_accept_tos%3Dhttps%253A%252F%252Fpolicies.google.com%252Fterms/googlechrome.pkg

echo "\
---------------------------------------------
Installing Chrome...
---------------------------------------------"
        sudo installer -pkg googlechrome.pkg -target /
        defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
        killall Dock

        rm -rf googlechrome.pkg

        brew install defaultbrowser

echo "\
---------------------------------------------
Setting Chrome as default browser.
You will be prompted.
---------------------------------------------"
defaultbrowser chrome

    else

echo "\
---------------------------------------------
Skipping Chrome install..
---------------------------------------------"

    fi

}
chrome-install
