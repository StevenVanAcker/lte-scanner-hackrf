UBUNTU_VERSION := 20.04

build:
	docker build --build-arg UBUNTU_VERSION=$(UBUNTU_VERSION) -t lte-scanner-hackrf .

run:
	docker run --name lte-scanner-hackrf --rm -ti --privileged -v $$PWD:/data -v /dev:/dev lte-scanner-hackrf /bin/bash

