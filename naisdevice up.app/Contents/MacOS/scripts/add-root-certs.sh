#!/bin/bash

echo \
"

You must to install NAV & naisdevice system root \
certificates.\

The script will continue when this is done."

open certs/naisdevice-nav-root.mobileconfig
open -b com.apple.systempreferences /System/Library/PreferencePanes/Profiles.prefPane

while ! sudo profiles -L | grep "AD9ACDCC-3BFD-463C-A589-0A94BC0B463D"; do
  sleep 2
done
