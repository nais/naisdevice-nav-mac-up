#!/bin/bash
# shellcheck disable=SC2154

if [[ "$chk5" = "1" ]]; then
    get_repo_address() {

        echo What is your dotfiles repo url?
        read REPO_URL

        response=$(curl --write-out '%{http_code}' --silent --output /dev/null "$REPO_URL")
        if [[ "$response" = "200" ]]; then
            echo "Looks OK i guess..moving on.."
        else
            echo "That's a bad address, try again"
            get_repo_address
        fi

    }

    get_repo_address

    dotfiles_folder=$(echo "$REPO_URL" | awk -F "/" '{print $NF}')

    git clone "$REPO_URL"
    echo "Your repo has been cloned $PWD/$dotfiles_folder"

fi
