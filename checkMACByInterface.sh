#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

MAC=$(ifconfig "$1" | grep ether | grep -Eo "([a-fA-F0-9]{2}\:){5}[a-fA-F0-9]{2}")
MAC_CUTTED=$(echo "$MAC" | cut -c -8)
VENDOR=$(grep "$MAC_CUTTED" "$SCRIPT_DIR/MAC_VS_VENDOR" | cut -c 10-)
echo "$MAC"
echo "$VENDOR"