#!/bin/bash

curl -L https://raw.githubusercontent.com/nais/naisdevice-nav-mac-up/main/print/X950_Series_Print_Scan.pkg \
  --output X950_Series_Print_Scan.pkg

/usr/sbin/installer -pkg X950_Series_Print_Scan.pkg -target /

/usr/sbin/lpadmin -E -p "NAV_SikkerPrint" \
  -v "smb://10.88.0.21/FargeDuplex%20IKSS" \
  -P "/System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/PrintCore.framework/Resources/Generic.ppd" \
  -o printer-is-shared=false \
  -o APOptionalDuplexer=True

/usr/sbin/cupsenable "NAV_SikkerPrint"
/usr/sbin/cupsaccept "NAV_SikkerPrint"

exit 0