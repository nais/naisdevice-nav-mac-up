#!/bin/bash
# shellcheck disable=SC2154

source vars

test-repo-address() {
    if ! git ls-remote "${clone_target}"; then
        echo "That's a bad address, try again"
        get-repo-url
        test-repo-adress
    else
        echo "Looks OK i guess..moving on.."
    fi
}

test-repo-address

echo "${clone_target}"

#dotfiles_folder=$(echo "${clone_target}" | awk -F "/" '{print $NF}')

#git clone ${clone_target} ~/
#echo "Your repo has been cloned ~/$dotfiles_folder"
