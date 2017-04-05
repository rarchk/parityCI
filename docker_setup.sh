echo
echo "===================="
echo "Starting Docker Engine setup"
echo "===================="
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y
echo
echo "===================="
echo "Setting up docker repo"
echo "====================" 

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update 

echo
echo "===================="
echo "Installing Docker-ce"
echo "===================="
sudo apt-get install docker-ce -y

echo
echo "===================="
echo "Running Docker"
echo "===================="
sudo docker run hello-world

echo
echo "===================="
echo "Compiling Parity"
echo "===================="
sudo docker build -t parity . 
sudo docker run --device /dev/tty -t parity