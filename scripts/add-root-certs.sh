#!/bin/bash


add-certs(){
CERTS="certs/*.cer"
for f in $CERTS
do
 echo "Installing $f root-cert..."
sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain "$f" 
done
}

echo "ROOTCERTS ########  $PWD"

add-certs