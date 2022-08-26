#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC2016
# shellcheck disable=SC2162

source vars 


if ! brew -v &> /dev/null
then
echo "\
---------------------------------------------
Getting latest homebrew for your architecture
---------------------------------------------"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# check platform and add Brew to user PATH (Assuming default macOS `zsh`)
if [[ $(uname -m) == 'arm64' ]]; then
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zshrc
	eval "$(/opt/homebrew/bin/brew shellenv)"
else
	echo 'eval "$(/usr/local/bin/brew shellenv)"' >>~/.zshrc
	eval "$(/usr/local/bin/brew shellenv)"
fi
fi

brew doctor

sudo echo "\
---------------------------------------------
Keeping sudo alive
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
	/opt/homebrew/bin/brew install "$t"
done

defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Slack.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Zoom.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/naisdevice.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'


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
/opt/homebrew/bin/brew install "$t"
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
