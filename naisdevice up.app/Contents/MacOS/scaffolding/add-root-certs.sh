#!/bin/bash

echo "\
---------------------------------------------
You must install NAV & naisdevice system 
root certificates in System Preferences.

The script will continue when this is done...
---------------------------------------------"

open scaffolding/naisdevice-nav-root.mobileconfig
open -b com.apple.systempreferences /System/Library/PreferencePanes/Profiles.prefPane

while ! sudo profiles -L | grep -q "AD9ACDCC-3BFD-463C-A589-0A94BC0B463D"; do
  sleep 3
done

sysprefs=$(pgrep "System Preferences")

kill "$sysprefs"