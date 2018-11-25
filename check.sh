#!/bin/bash


function toUpper() {

	MAC_OUT=$(echo "$1" | tr '[:lower:]' '[:upper:]')
	echo $MAC_OUT
}
function vendorFromMAC() {
	MAC=$(ifconfig $interface | grep ether | grep -Eo "([a-fA-F0-9]{2}\:?){6}")
	MAC=$(toUpper $MAC)

	MAC_CUTTED=$(echo "$MAC" | cut -c -8)
	VENDOR=$(grep "$MAC_CUTTED" "$SCRIPT_DIR/MAC_VS_VENDOR" | cut -c 10-)
	echo "$MAC"
	echo "$VENDOR"
}

function temperatureCPU() {
	sensors | grep -Eo "Core\ [01].*\ \ "
}
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

while getopts :m:t opt; do
	case $opt in
	m)
		interface=$OPTARG
		vendorFromMAC
	
	;;
	t)
		temperatureCPU
	;;
	\?)
		echo "WTF!"
		exit 1
	;;
	esac
done

