#!/bin/bash

MAC=$(ifconfig $1 | grep ether | grep -Eo "([a-fA-F0-9]{2}\:){5}[a-fA-F0-9]{2}")
MAC_CUTTED=$(echo $MAC | cut -c -8)
VENDOR=$(cat $HOME/repos/checkMAC/MAC_VS_VENDOR | grep $MAC_CUTTED | cut -c 10-)
echo "$MAC"
echo "$VENDOR"
