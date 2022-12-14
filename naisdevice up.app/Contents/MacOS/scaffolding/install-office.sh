#!/bin/bash
# shellcheck disable=SC1091
# shellcheck disable=SC2154

if test -f mspkgs; then

    echo "\
---------------------------------------------
Fetching & installing Office choices
---------------------------------------------"

    curl -sO https://macadmins.software/latest.xml
    source mspkgs

    word_dl=$(xmllint --xpath '//package[id="com.microsoft.word.standalone.365"]/./download/text()' latest.xml)
    excel_dl=$(xmllint --xpath '//package[id="com.microsoft.excel.standalone.365"]/./download/text()' latest.xml)
    powerpoint_dl=$(xmllint --xpath '//package[id="com.microsoft.powerpoint.standalone.365"]/./download/text()' latest.xml)
    outlook_dl=$(xmllint --xpath '//package[id="com.microsoft.outlook.standalone.365"]/./download/text()' latest.xml)
    teams_dl=$(xmllint --xpath '//package[id="com.microsoft.teams.standalone"]/./download/text()' latest.xml)
    rdp_dl=$(xmllint --xpath '//package[id="com.microsoft.remotedesktop.standalone"]/./download/text()' latest.xml)
    onedrive_dl=$(xmllint --xpath '//package[id="com.microsoft.onedrive.standalone"]/./download/text()' latest.xml)

    for p in "${pkgs[@]}"; do

        if [[ "$p" = "teams" ]]; then
            curl -L "$teams_dl" -o teams.pkg
            sudo installer -pkg teams.pkg -target /
            rm -rf teams.pkg
            defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Microsoft Teams.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

        fi

        if [[ "$p" = "outlook" ]]; then
            curl -L "$outlook_dl" -o outlook.pkg
            sudo installer -pkg outlook.pkg -target /
            rm -rf outlook.pkg
            defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Microsoft Outlook.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

        fi
        if [[ "$p" = "excel" ]]; then
            curl -L "$excel_dl" -o excel.pkg
            sudo installer -pkg excel.pkg -target /
            rm -rf excel.pkg
            defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Microsoft Excel.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

        fi
        if [[ "$p" = "word" ]]; then
            curl -L "$word_dl" -o word.pkg
            sudo installer -pkg word.pkg -target /
            rm -rf word.pkg
            defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Microsoft Word.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

        fi
        if [[ "$p" = "powerpoint" ]]; then
            curl -L "$powerpoint_dl" -o pp.pkg
            sudo installer -pkg pp.pkg -target /
            rm -rf pp.pkg
            defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Microsoft PowerPoint.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

        fi
        if [[ "$p" = "rdp" ]]; then
            curl -L "$rdp_dl" -o rdp.pkg
            sudo installer -pkg rdp.pkg -target /
            rm -rf rdp.pkg
            defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Microsoft Remote Desktop.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

        fi

        if [[ "$p" = "onedrive" ]]; then
            curl -L "$onedrive_dl" -o onedrive.pkg
            sudo installer -pkg onedrive.pkg -target /
            rm -rf onedrive.pkg
        fi

        killall Dock

    done
    rm -rf latest.xml
    rm mspkgs
fi
