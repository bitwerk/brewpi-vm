# Build: sudo docker build -t=brewpi .
# Run:   sudo docker run -t --rm -v ~/brewpi:/usr/local/brewpi brewpi git clone https://github.com/BrewPi/spark-firmware && git clone https://github.com/BrewPi/firmware.git && git clone https://github.com/BrewPi/brewpi-script.git && git clone https://github.com/BrewPi/brewpi-www.git

FROM ubuntu:14.04

# dev tools
RUN apt-get update && apt-get install -y git make wget emacs

# gcc-arm
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:terry.guo/gcc-arm-embedded
RUN apt-get update && apt-get install -y gcc-arm-none-eabi

# dfu-util
RUN \
  mkdir -p /usr/local/dfu-util && cd /usr/local/dfu-util && \
  wget http://dfu-util.sourceforge.net/releases/dfu-util-0.8.tar.gz -qO - | tar -xz

# LAMP
RUN apt-get install -y lamp-server^

RUN mkdir -p /usr/local/brewpi

###############################
##           TODO            ##
###############################

# Install USB drivers (?)

# Add DFU-util and the ARM toolchain to your PATH variable

# configure apache/php (?)

###############################

WORKDIR /usr/local/brewpi
 
CMD ["bash"]
