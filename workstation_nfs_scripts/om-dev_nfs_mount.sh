#!/bin/bash

if [[ $1 =~ ^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|$)){4}$ ]]; then
    VM_IP=$1
else
    echo "$VM_IP is not a valid IPv4 address"
    echo "Usage: om-dev_nfs_mount.sh <IP address of VM>"
fi     

HERE=$(pwd)
echo "Setting up NFS access to Open Money directories on VM at $VM_IP from $HERE"

nfs_mount()
{
    # Create the mount point if it does not exist already:
    if [ -d "$HERE/$1" ]; then
        echo "$HERE/$1 exists already"
    else
        mkdir $HERE/$1
        echo "$HERE/$1 has been created"
    fi
    # Mount VM's OM NFS share:
    sudo mount -t nfs -o vers=4 $VM_IP:/$1 $HERE/$1
}
nfs_mount 'openmoney-api'
nfs_mount 'openmoney-gift'
nfs_mount 'openmoney-gift-api'
nfs_mount 'openmoney-network'

