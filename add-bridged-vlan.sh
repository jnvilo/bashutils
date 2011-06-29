#!/bin/bash

# This is a simple script that will write out the commands needed to create 
# a bridge on a vlan on a physical interface.
# It needs the vlan id, device name, and ip address to put on the bridge. 

VLAN_IDR=$1
DEVICE=$2
IPADDRESS=$3

echo "nmcli con add type bridge ifname br$VLAN_IDR con-name br$VLAN_IDR connection.autoconnect yes"
echo "nmcli con mod br$VLAN_IDR ipv4.method manual ipv4.address $IPADDRESS/24"
echo "nmcli con add type vlan con-name $DEVICE.$VLAN_IDR dev $DEVICE id $VLAN_IDR master br$VLAN_IDR connection.autoconnect yes"
echo "nmcli c d br$VLAN_IDR"
echo "sleep 1"
echo "nmcli c u br$VLAN_IDR"


