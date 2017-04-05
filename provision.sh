PARITY_VERSION=$1
sudo apt-get install lxd -y
sudo lxd init 
sudo lxc launch ubuntu:16.04 dockC -p default -p docker
sudo lxc config set dockC security.privileged true
sudo lxc restart dockC
sudo lxc exec dockC -- git clone https://github.com/rarchk/parityCI
sudo lxc exec dockC -- cat $PARITY_VERSION >> ~/.bashrc 
sudo lxc exec dockC -- bash parityCI/docker_setup.sh 
