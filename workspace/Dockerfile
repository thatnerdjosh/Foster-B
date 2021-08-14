# use the latest stable version of debian for the build system
FROM debian:stable

# Environment Variables
ENV TERM xterm
ENV container docker

# workaround: some kind of signal relay issue
STOPSIGNAL SIGRTMIN+3

# Update all packages, install git/cmake/dev tools
RUN apt-get autoclean && apt-get update
RUN apt-get -y install git g++ make cmake
RUN apt-get -y install whiptail

# Examplar source acquisition

# This directory will be replaced by the workspace in the volume
WORKDIR "/opt"

# Pull down Exemplar
RUN git clone https://source.silogroup.org/Cycle0/Rex.git rex

# Change dir to Exemplar
WORKDIR "/opt/rex"

# Build and install exemplar
RUN cmake . && \
	make && \
	cp rex /usr/bin/rex

# Development Pull from Local
WORKDIR "/opt/foster"

# benign entry point, keep container running on restart
ENTRYPOINT [ "tail", "-f", "/dev/null" ]
