PARITY CI
=== 
It happens in three steps 

1. Provision an ubuntu 16.04 image with docker-engine installed in it. I have tried different drivers for doing this 
    - AWS (Due to machine's constraints, build took a lot of time. Check out [limitations](#limitations))
    - Azure 
    - LXD (System container service, better than tools like vagrant and virtual box, for local CI system)
2. Invoke a docker container which builds parity with appropriate arguements 

# Limitations 
- I tried with micro aws installation, and compilation requirements were not met. It was failing. So needed a big machine with at least 2gb ram with 2 core systems.   