#!/bin/bash

FILES="certs/*.cer"
for f in $FILES
do
 echo "Processing $f file..."
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain "$f" 
wait
done

exit 0
