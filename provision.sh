PARITY_VERSION=$1
sudo apt-get install lxd -y
sudo lxd init 
sudo lxc launch ubuntu:16.04 c1 -p default -p docker
sudo lxc config set c1 security.privileged true
sudo lxc restart c1
sudo lxc exec c1 bash 
export $PARITY_VERSION
bash 