#!/bin/bash
# shellcheck disable=SC2154
install-brew(){
read -p "Do you want to install \"Homebrew\"? (y/n) " yn

case $yn in
[yY])
	echo "lets's go"
	sudo xcode-select --install || true
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	brew doctor

	echo "Brewing NAV taps"

	brew tap nais/tap

	IFS=$'\r\n' GLOBIGNORE='*' command eval 'taps=($(cat nav-taps))'

	for t in "${taps[@]}"; do
		echo "## Brewing $t"
		/opt/homebrew/bin/brew install "$t"
		wait
	done

	echo "Brewing personal taps"

	IFS=$'\r\n' GLOBIGNORE='*' command eval 'taps=($(cat personal-taps))'

	for t in "${taps[@]}"; do
		echo "## Brewing $t"
		/opt/homebrew/bin/brew install "$t"
		wait
	done

	echo "brewing done!"

	;;
[nN])
	echo "skipping brew..."
	;;
*) echo invalid response ;;
esac
}
install-brew