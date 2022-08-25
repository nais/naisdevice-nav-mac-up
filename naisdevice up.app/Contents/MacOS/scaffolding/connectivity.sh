#!/bin/bash
# shellcheck disable=SC2181
# shellcheck disable=SC1091

echo -e "GET https://google.com HTTP/1.0\n\n" | nc google.com 443 > /dev/null 2>&1

if [ $? -eq 0 ]; then
echo "\
---------------------------------------------
We are online - moving on..
---------------------------------------------"
else
    source scaffolding/connect-error.sh
fi