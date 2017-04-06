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
- For build purposes, Host requieres to have greater than 1GB RAM. The build process failed with aws micro-instance which has only 1 GB of RAM.   
- LXD's privileges have been marked as true, because docker requires all capabilities
- There is security problem in `aws_upload.sh` as I have no other efficient way to specify aws credentials for working piece of code. 
    - May be in this case, we could use hosted service for storing secrets. 
    - Fun thing was that when I commited the keys to github, I saw mail by aws reporting me of that commit. Just goes to say that they are watching.   
- Rust installation script shows `yes/no` promts, that needed to be handled via `expect` linux tool.  
 
# Edits 
1. more documented README
2. Added S3 storage for latest builds. 