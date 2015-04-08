brewpi-vm
==========
Virtualized BrewPi development environment

# TODO
See comments in Dockerfile.

# Prerequisites
- Docker (or boot2docker)

# Build image
sudo docker build -t=brewpi .

# Initialize
sudo docker run -t --rm -v ~/brewpi:/usr/local/brewpi brewpi git clone https://github.com/BrewPi/spark-firmware && git clone https://github.com/BrewPi/firmware.git && git clone https://github.com/BrewPi/brewpi-script.git && git clone https://github.com/BrewPi/brewpi-www.git

# Compile
sudo docker run -t --rm -v ~/brewpi:/usr/local/brewpi brewpi [todo: insert compile command here]

# Run web server (deamon mode / port forwarding)
sudo docker run -d -v ~/brewpi:/usr/local/brewpi -p 80:80 brewpi
