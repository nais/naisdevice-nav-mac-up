#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC2016
# shellcheck disable=SC1091

source vars

brew -v

if "$?" != "0"; then
	echo "\
---------------------------------------------
Getting latest homebrew for your architecture
---------------------------------------------"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# check platform and add Brew to user PATH (Assuming default macOS `zsh`)
	if [[ $(arch) == 'arm64' ]]; then
		echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>"$HOME"/.zshrc
		eval "$(/opt/homebrew/bin/brew shellenv)"
	else
		echo 'eval "$(/usr/local/bin/brew shellenv)"' >>"$HOME"/.zshrc
		eval "$(/usr/local/bin/brew shellenv)"
	fi
fi
sudo echo "\
---------------------------------------------
sudo alive - a - a - a - a - sudo alive 
---------------------------------------------"

echo "\
---------------------------------------------
Brewing NAV taps
---------------------------------------------"

brew tap nais/tap

taps=(naisdevice slack zoom)
for t in "${taps[@]}"; do
	echo "\
---------------------------------------------
Brewing $t
---------------------------------------------"
	brew install "$t"
done

defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Slack.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Zoom.us.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/naisdevice.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
killall Dock

source taps

if [[ "$personaltaps" != "" ]]; then
	echo "\
---------------------------------------------
Brewing personal taps
---------------------------------------------"
	for t in "${personaltaps[@]}"; do
		echo "\
---------------------------------------------
Brewing $t
---------------------------------------------"
		brew install "$t"
		wait
	done

	echo "\
---------------------------------------------
Personal brewing done!
---------------------------------------------"
else

	echo "\
---------------------------------------------
Skipping personal brewing...
---------------------------------------------"

fi
