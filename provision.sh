lxc launch ubuntu:16.04 c2 -p default -p docker
sleep 1
lxc config set c2 security.privileged true
lxc restart c2
sleep 1
lxc exec c2 -- git clone https://github.com/rarchk/parityCI
lxc exec c2 -- bash parityCI/docker_setup.sh 
