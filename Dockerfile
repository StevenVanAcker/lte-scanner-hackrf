ARG UBUNTU_VERSION=latest
FROM ubuntu:${UBUNTU_VERSION}

COPY install.sh /opt/install.sh
RUN chmod +x /opt/install.sh
RUN /opt/install.sh

