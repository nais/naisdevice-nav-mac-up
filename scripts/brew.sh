#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC2016
# shellcheck disable=SC2162

install-brew() {
	read -p "Do you want to install \"Homebrew\"? (y/n) " yn

	case $yn in
	[yY])
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

			# check platform and add Brew to user PATH (Assuming default macOS `zsh`)
			if [[ $(uname -m) == 'arm64' ]]; then
				echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
				eval "$(/opt/homebrew/bin/brew shellenv)"
			else
				echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zshrc
				eval "$(/usr/local/bin/brew shellenv)"
			fi

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
