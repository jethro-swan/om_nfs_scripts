#!/bin/bash

# Clone the four Open Money repositories:
git clone https://github.com/jethro-swan/openmoney-api
git clone https://github.com/jethro-swan/openmoney-network
git clone https://github.com/jethro-swan/openmoney-gift-api
git clone https://github.com/jethro-swan/openmoney-gift

sudo apt install nfs-kernel-server
#sudo cat /proc/fs/nfsd/versions

sudo mkdir -p /srv/nfs4/{openmoney-api,openmoney-network,openmoney-gift-api,openmoney-gift}
sudo mount --bind /home/om/openmoney-api /srv/nfs4/openmoney-api
sudo mount --bind /home/om/openmoney-network /srv/nfs4/openmoney-network
sudo mount --bind /home/om/openmoney-gift-api /srv/nfs4/openmoney-gift-api
sudo mount --bind /home/om/openmoney-gift /srv/nfs4/openmoney-gift

# The shares are exported for access by other devices on the LAN:
sudo cat b/nfs_binds >> /etc/fstab
sudo cat b/nfs_exports >> /etc/exports
sudo exportfs -ra

echo "If you are using a LAN subnet other than 192.168.1.0/24 you will have to"
echo "edit  /etc/exports  accordingly."


