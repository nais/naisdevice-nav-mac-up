#!/bin/bash
# shellcheck disable=SC2034
# shellcheck disable=SC2162

if read -p "Do you want to install Google Chrome? (y/n)" \
    confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    chrome=install
fi

if read -p "Do you want install homebrew? (y/n)" \
    confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    homebrew=install
fi
