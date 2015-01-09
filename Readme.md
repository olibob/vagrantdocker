## Centos 7 based Vagrant VM for docker for Mac OS X

Quick Vagrant setup to get the latest docker installed.

### Things you might want to change/modify !

**Users folder mapping**

This is needed to be able to map local folder(s) to Volume(s) in docker and has no use otherwise.

```
config.vm.synced_folder "/Users", "/Users"
```

**Basic VM configurations**

Self explanatory.

```
config.vm.network "public_network"
vb.cpus = 4
vb.memory = 4096
config.vm.hostname = "dockerbox"
```

### Usage

```
vagrant up
```

If you need to force provisionning


```
vagrant up --provision
```

You can now access docker as root within the VM or over the network on port 2375.

- SSH into the VM and get the VM's IP address. You can now log out of the VM.
- Open a new shell on your Mac
- Set the DOCKER_HOST environment variable

```
export DOCKER_HOST="tcp://<the VM's IP address>:2375"

```

- Test docker connection


```
$ docker info
Containers: 0
Images: 0
Storage Driver: devicemapper
 Pool Name: docker-253:1-135257989-pool
 Pool Blocksize: 65.54 kB
 Data file: /var/lib/docker/devicemapper/devicemapper/data
 Metadata file: /var/lib/docker/devicemapper/devicemapper/metadata
 Data Space Used: 307.2 MB
 Data Space Total: 107.4 GB
 Metadata Space Used: 733.2 kB
 Metadata Space Total: 2.147 GB
 Library Version: 1.02.82-git (2013-10-04)
Execution Driver: native-0.2
Kernel Version: 3.10.0-123.el7.x86_64
Operating System: CentOS Linux 7 (Core)
CPUs: 4
Total Memory: 3.704 GiB
Name: dockerbox
ID: AZ6C:XSUS:W2DV:ZPJ5:XQGZ:2CPG:MV5J:6BLF:WYZO:TBXH:6VCV:HBIF
```

