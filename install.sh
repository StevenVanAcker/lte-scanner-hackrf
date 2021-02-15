#!/bin/sh -e

echo "Installing from source"

export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y build-essential git mdm vim libboost-thread-dev libfftw3-dev libhackrf-dev

# Following https://github.com/JiaoXianjun/LTE-Cell-Scanner
apt-get install --no-install-recommends -y cmake libitpp-dev librtlsdr-dev libopenblas-dev libncurses5-dev 

mkdir -p /opt
cd /opt
test -d LTE-Cell-Scanner || git clone https://github.com/JiaoXianjun/LTE-Cell-Scanner.git
cd LTE-Cell-Scanner
mkdir -p build
cd build
cmake .. -DUSE_HACKRF=1 -DUSE_OPENCL=0 
make -j$(ncpus)
make install

