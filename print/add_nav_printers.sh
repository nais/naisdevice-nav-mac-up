#!/bin/bash

cat <<EOF
This script will now download a generic lexmark driver
and add the NAV printer to CUPS.

This requires Rosetta2 so the installer might fail.
Rosetta2 can be installed on the command line like so:

"/usr/sbin/softwareupdate --install-rosetta --agree-to-license"

You will be prompted for your sudo/admin password.

EOF

read -p "# Do you wish to proceed? " -n 1 -r
echo # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then

  curl -L https://raw.githubusercontent.com/nais/naisdevice-nav-mac-up/main/print/X950_Series_Print_Scan.pkg \
    -o X950_Series_Print_Scan.pkg

  echo "Run Lexmark installer."
  sudo /usr/sbin/installer -pkg X950_Series_Print_Scan.pkg -target /

  echo " # Adding NAV Printer to CUPS."
  sudo /usr/sbin/lpadmin -E -p "NAV_SikkerPrint" \
    -v "smb://10.88.0.21/FargeDuplex%20IKSS" \
    -P "/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Resources/Generic.ppd" \
    -o printer-is-shared=false \
    -o APOptionalDuplexer=True

  sudo /usr/sbin/cupsenable "NAV_SikkerPrint"
  sudo /usr/sbin/cupsaccept "NAV_SikkerPrint"
  echo "Cleaning up."
  rm  -rf X950_Series_Print_Scan.pkg
  echo "# Done!"
  echo "# Oh, BTW - Remember - rainforest.."


else
  exit 1
fi
exit 0
