#!/bin/bash

	read -p "Do you have a dotfiles repo you want to import? (y/n)" yn

	case $yn in
	[yY])


			echo What is your repo url?
			read REPO_URL

			response=$(curl --write-out '%{http_code}' --silent --output /dev/null "$REPO_URL")
			if [[ "$response" = "200" ]]; then
				echo "Looks OK i guess..moving on.."
			else
				echo "That's a bad address, try again"
				get_repo_address
			fi

		
		dotfiles_folder=$(echo "$REPO_URL" | awk -F "/" '{print $NF}')
		echo "$dotfiles_folder"

		git clone "$REPO_URL"

		IFS=$'\r\n' GLOBIGNORE='*' command eval 'dotfiles=($(find "$PWD/dotfiles/files" -maxdepth 1 -type f))'

		for f in "${dotfiles[@]}"; do
			echo "## adding symlink $f"
		done

		;;

	\
		[nN])
		echo "skipping dotfiles..."
		;;
	*) echo invalid response ;;
	esac
