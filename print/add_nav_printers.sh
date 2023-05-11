#!/bin/bash

kernel_name="$(uname -s)"

case "${kernel_name}" in
  Linux*)
    warning="
      This requires that smbclient is installed.
      smbclient can be installed on the command line like so:

      'sudo apt install smbclient'
    "
    ;;
  Darwin*)
    warning="
      This requires Rosetta2 so the installer might fail.
      Rosetta2 can be installed on the command line like so:

      '/usr/sbin/softwareupdate --install-rosetta --agree-to-license'
      "
    ;;
esac

cat <<EOF
This script will now download a generic lexmark driver
and add the NAV printer to CUPS.

${warning}

You will be prompted for your sudo/admin password.

EOF

read -p "# Do you wish to proceed? " -n 1 -r
echo # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then

  case "${kernel_name}" in
    Linux*)
      echo "Downloading Lexmark X950 series PPD"
      curl -L "https://www.openprinting.org/download/PPD/Lexmark/Lexmark_X950_Series.ppd" \
        -o postscript-lexmark-x950.ppd
      sudo mkdir -p /usr/local/share/ppd/
      sudo mv postscript-lexmark-x950.ppd /usr/local/share/ppd/
      ppd_path=/usr/local/share/ppd/postscript-lexmark-x950.ppd
      ;;
    Darwin*)
      curl -L https://raw.githubusercontent.com/nais/naisdevice-nav-mac-up/main/print/X950_Series_Print_Scan.pkg \
        -o X950_Series_Print_Scan.pkg

      echo "Run Lexmark installer."
      sudo /usr/sbin/installer -pkg X950_Series_Print_Scan.pkg -target /
      ppd_path="/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Resources/Generic.ppd"
      echo "Cleaning up installer."
      rm  -rf X950_Series_Print_Scan.pkg
      ;;
    *) 
      echo "Unsupported platform: ${kernel_name}"
      exit 2
      ;;
  esac

  echo " # Adding NAV Printer to CUPS."
  sudo /usr/sbin/lpadmin -E -p "NAV_SikkerPrint" \
    -v "smb://10.88.0.21/FargeDuplex%20IKSS" \
    -P "${ppd_path}" \
    -o printer-is-shared=false \
    -o APOptionalDuplexer=True

  sudo /usr/sbin/cupsenable "NAV_SikkerPrint"
  sudo /usr/sbin/cupsaccept "NAV_SikkerPrint"

  echo "# Done!"
  echo "# Oh, BTW - Remember - rainforest.."

else
  exit 1
fi
exit 0
