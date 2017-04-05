FROM ubuntu:16.04
MAINTAINER Ronak Kogta <rixor786@gmail.com>
RUN apt-get update && apt-get upgrade -y && apt-get install gcc git pkg-config libssl-dev libudev-dev cargo -y
RUN git clone https://github.com/paritytech/parity
ARG VERSION
RUN cargo build --$VERSION

