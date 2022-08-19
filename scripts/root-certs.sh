#!/bin/bash

FILES="/certs/*.cer"
for f in $FILES
do
 echo "Processing $f certificate..."
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain "$f" 
wait
done
