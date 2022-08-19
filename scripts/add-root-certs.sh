#!/bin/bash

add-certs(){
certs="../certs/*"

for c in $certs
do
   Adding "$c"
   sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain "$c"
done
}

add-certs