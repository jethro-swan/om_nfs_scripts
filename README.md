## om_nfs_scripts

A small collection of BASH scripts to manage NFS mounts of VM-hosted OM directories on a development workstation in the same subnet.

These scripts are divided into two sets:

### vm_nfs_scripts

The **vm_nfs_setup.sh** script is used to create NFS shared of the four **openmoney** directories to allow direct access from 
any workstation on the same subnet. (If the LAN subnet is anything other than 192.168.1.0/24 you will need to edit this file.)

It is assumed that
- the Open Money components are running together within a virtual 
- the OM code (including the Dockerized Couchbase) is isolated within a VM 
- the only non-root user is "om"
- user "om" has passwordless sudo access

(See also https://github.com/jethro-swan/openmoney-api/blob/master/docker-scripts/README.md)

### workstation_nfs_scripts

The **om-dev_nfs_mount.sh** is used to mount the set of **openmoney** directories within the current working directory and, where necessary, create the mount points.

The **om-dev_nfs_umount.sh** is used to unmount the set of **openmoney** directories within the current working directory.
