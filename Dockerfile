############################################################
# Dockerfile to build parity client
# Based on Ubuntu
############################################################

# Set the base image from ubuntu 
FROM ubuntu:16.04

# Author
MAINTAINER Ronak Kogta <rixor786@gmail.com>

# Getting Dependencies 
RUN apt-get update && apt-get upgrade -y && apt-get install gcc git pkg-config libssl-dev libudev-dev -y

##################### PARITY SOURCE CODE ####################
WORKDIR /code
ADD . /code 
RUN git clone https://github.com/paritytech/parity

#################### PARITY COMPILATION #####################
CMD ./init.sh 


