## OM NFS scripts

A small collection of BASH scripts to manage NFS mounts of VM-hosted OM directories on a development workstation in the same subnet.

These scripts are divided into two sets:

### VM NFS setup script

The **vm_nfs_scripts/vm_nfs_setup.sh** script is used to create NFS shared of the four **openmoney** directories to allow direct access from 
any workstation on the same subnet. (If the LAN subnet is anything other than 192.168.1.0/24 you will need to edit this file.)

    git clone https://github.com/jethro-swan/om_nfs_scripts/
    cd
    cp om_nfs_scripts/vm_nfs_scripts/vm_nfs_setup.sh .
    sudo su
    ./om_nfs_scripts/vm_nfs_scripts/vm_nfs_setup.sh
    exit

This creates and exports four shares in:

    /srv/nfs4/openmoney-api/
    /srv/nfs4/openmoney-network/
    /srv/nfs4/openmoney-gift-api/
    /srv/nfs4/openmoney-gift/

It is assumed that
- the OM components (including the Dockerized Couchbase) are isolated within a VM 
- the only non-root user is "om"
- user "om" has passwordless sudo access

(See also https://github.com/jethro-swan/openmoney-api/blob/master/docker-scripts/README.md)

### workstation NFS setup/mount/unmount scripts

The **workstation_nfs_scripts/om-dev_nfs_mount.sh** is used to mount the set of **openmoney** directories within the current working directory and, where necessary, create the mount points.

The **workstation_nfs_scripts/om-dev_nfs_umount.sh** is used to unmount the set of **openmoney** directories within the current working directory.


    git clone https://github.com/jethro-swan/om_nfs_scripts/
    sudo cp om_nfs_scripts/vm_nfs_scripts/vm_nfs_setup.sh /usr/local/bin/
    cd /path/to/working/directory/
    vm_nfs_setup.sh <hostname of VM>
