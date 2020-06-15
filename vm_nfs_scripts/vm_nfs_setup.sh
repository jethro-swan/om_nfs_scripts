#!/bin/bash
  
VM_IP=$(hostname -I)
echo $VM_IP

SUBNET="192.168.1.0/24"
echo "If you are using a LAN subnet other than 192.168.1.0/24 you will have to"
echo "edit  /etc/exports  accordingly."

# Clone the four Open Money repositories:
git clone https://github.com/jethro-swan/openmoney-api
git clone https://github.com/jethro-swan/openmoney-network
git clone https://github.com/jethro-swan/openmoney-gift-api
git clone https://github.com/jethro-swan/openmoney-gift

apt install nfs-kernel-server
#cat /proc/fs/nfsd/versions

create_bind_point()
{
    cd /home/om
    git clone https://github.com/jethro-swan/$1
    mkdir /srv/nfs4/$1.$VM_IP
    mount --bind /home/om/$1 /srv/nfs4/$1.$VM_IP
    # NFS binds
    echo "/home/om/$1 /srv/nfs4/$1.$VM_IP none bind 0 0" >> /etc/fstab
    # NFS exports
    echo "/srv/nfs4/$1.$VM_IP $SUBNET(rw,sync,no_subtree_check)" >> /etc/exports
}
create_bind_point "openmoney-api"
create_bind_point "openmoney-network"
create_bind_point "openmoney-gift-api"
create_bind_point "openmoney-gift"
exportfs -ra
