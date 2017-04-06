PARITY CI
=== 
## USAGE
### Prerequisites

```bash
sudo apt-get install lxd -y
sudo lxd init  
``` 

### Invoking Automated Build

```bash
git clone https://github.com/rarchk/parityCI
cd parityCI
sudo su
./provision.sh 
```

## Methedology 
I've used ubuntu 16.04 as base machine from which I invoke my scripts. Build can happen locally or in cloud. 
I've tested three drivers for building CI for parityCI, where each had fresh `ubuntu:16.04` provisioned

- AWS (Due to machine's constraints, build took a lot of time. Check out [limitations](#limitations))
- Azure 
- LXD
    - An experimental replacement for vagrant. Works well, consumes less memory, but workflow still needs to defined.
    - Builds a ubuntu image, and then installs docker. In this docker container, we build `parity`
    - Could have used `systemd-nspawn` containers 

Latest Build is available at [https://s3.amazonaws.com/my-parity-client/target/release/parity](https://s3.amazonaws.com/my-parity-client/target/release/parity)
## Limitations 
- I tried with micro aws installation, and compilation requirements were not met. It was failing. So needed a big machine with at least 2gb ram with 2 core systems.
- LXD's privileges have been marked as true, because docker requires all capabilities
- Currently you cannot input the appropriate versions, as I didn't had enough time. 
- I faced the problems in autmating rust script, and my first go at aws failed as there was not enough memory 
- I have not updated the files to a public storage 


# Edits 
1. Improved README
2. Added S3 storage