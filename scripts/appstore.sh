#!/bin/bash

check-for-mas()
{
if grep -oq 'mas' personal-taps ;
then
  echo "check for appleID"
check_for_id=$(defaults read MobileMeAccounts Accounts |grep "AccountID")
if [[ ! "$check_for_id" = "" ]]; then
echo "You must sign into the Mac App Store"
open -a "App Store"
sleep 5
check-for-mas
fi
fi
}
check-for-mas
