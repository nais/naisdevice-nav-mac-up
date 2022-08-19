#!/bin/bash

chrome-offer() {
    read -p "Do you want Google Chrome? (y/n)" yn

    case $yn in
    [yY])
        echo "Getting latest stable release..."
        curl -sSO https://dl.google.com/chrome/mac/stable/accept_tos%3Dhttps%253A%252F%252Fwww.google.com%252Fintl%252Fen_ph%252Fchrome%252Fterms%252F%26_and_accept_tos%3Dhttps%253A%252F%252Fpolicies.google.com%252Fterms/googlechrome.pkg

        echo "Installing Chrome..."
        sudo installer -pkg googlechrome.pkg -target /

        wait

        rm -rf googlechrome.pkg

        ;;
    [nN])
        echo "skipping chrome..."
        ;;
    *) echo invalid response ;;
    esac
}
chrome-offer
