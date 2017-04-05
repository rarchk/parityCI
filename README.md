PARITY CI
=== 
## USAGE
```bash
sudo apt-get install lxd -y
sudo lxd init 
git clone https://github.com/rarchk/parityCI
cd parityCI
./provision.sh 
  ```
It happens in three steps 

1. Provision an ubuntu 16.04 image with docker-engine installed in it. I have tried different drivers for doing this 
    - AWS (Due to machine's constraints, build took a lot of time. Check out [limitations](#limitations))
    - Azure 
    - LXD (System container service, better than tools like vagrant and virtual box, for local CI system)
2. Invoke a docker container which builds parity with appropriate arguements 

# Limitations 
- I tried with micro aws installation, and compilation requirements were not met. It was failing. So needed a big machine with at least 2gb ram with 2 core systems.
- LXD's privileges have been marked as true, because docker requires all capabilities
- Currently you cannot input the appropriate versions, as I didn't had enough time. 
- I faced the problems in autmating rust script, and my first go at aws failed as there was not enough memory 
- I have not updated the files to a public storage 

# Conclusion 
- I took 4 hours to build a very minimal version of parityCI, and it is not upto the mark. 
