#!/bin/bash

# Identify VM hostname:
VM_HOSTNAME=$(hostname)
echo $VM_HOSTNAME

SUBNET="192.168.1.0/24"
echo "If you are using a LAN subnet other than 192.168.1.0/24 you will have to"
echo "edit  /etc/exports  accordingly."

apt install nfs-kernel-server
#cat /proc/fs/nfsd/versions

create_bind_point()
{
    cd /home/om
    git clone https://github.com/jethro-swan/$1
    mkdir /srv/nfs4/$1.$VM_HOSTNAME
    mount --bind /home/om/$1 /srv/nfs4/$1.$VM_HOSTNAME
    # NFS binds
    echo "/home/om/$1 /srv/nfs4/$1.$VM_HOSTNAME none bind 0 0" >> /etc/fstab
    # NFS exports
    echo "/srv/nfs4/$1.$VM_HOSTNAME $SUBNET(rw,sync,no_subtree_check)" >> /etc/exports
}
create_bind_point "openmoney-api"
create_bind_point "openmoney-network"
create_bind_point "openmoney-gift-api"
create_bind_point "openmoney-gift"
exportfs -ra
