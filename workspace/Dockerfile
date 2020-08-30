# use the latest version of fedora for the build system
FROM debian:stable

# Environment Variables
ENV TERM xterm
ENV container docker

# workaround: some kind of signal relay issue
STOPSIGNAL SIGRTMIN+3

# Update all packages, install git/cmake/dev tools
RUN apt-get autoclean && apt-get update
RUN apt-get -y install git g++ make cmake

# Examplar source acquisition

# This directory will be replaced by the workspace in the volume
WORKDIR "/opt"

# Pull down Exemplar
RUN git clone http://source.surroindustries.com/Cycle0/Examplar.git examplar

# Change dir to Exemplar
WORKDIR "/opt/examplar"

# Build and install exemplar
RUN cmake . && \
	make && \
	cp examplar /usr/bin/examplar

# Development Pull from Local
WORKDIR "/opt/foster"

# benign entry point
ENTRYPOINT [ "bash" ]
