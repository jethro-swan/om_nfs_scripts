#!/bin/bash

HERE=$(pwd)

nfs_umount()
{
    # Unmount VM's OM NFS share:
    echo $HERE/$1
    sudo umount $HERE/$1
}
nfs_umount 'openmoney-api'
nfs_umount 'openmoney-gift'
nfs_umount 'openmoney-gift-api'
nfs_umount 'openmoney-network'

