#!/bin/bash

root_test() {
    if [ "$EUID" -eq 0 ]; then
        cat <<'NOROOT'
**********************************************
This script must *not* run as root. 
Re-run as regular user and you will be 
prompted for sudo when needed.
Exiting...
---------------------------------------------"
NOROOT
        exit 1
    fi
}

root_test
