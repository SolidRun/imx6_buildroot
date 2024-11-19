# Base image
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# Update & upgrade the packages
RUN set -e; apt-get update && DEBCONF_NOWARNINGS=yes \
  apt-get install -y apt-utils && apt-get upgrade -y

# Install packages
RUN apt-get install -y \
	git make mtools coreutils u-boot-tools bison \
	gcc-arm-linux-gnueabihf gcc-arm-linux-gnueabi \
	gcc-aarch64-linux-gnu python3 python3-pyelftools \
	libssl-dev build-essential device-tree-compiler \
	bc unzip tar util-linux binutils e2fsprogs gawk \
	wget diffstat texinfo chrpath sed g++ bash patch \
	cpio python2 rsync file python3-pip flex dosfstools \
  parted udev


# Install python modules
RUN pip3 install pycryptodome
RUN pip3 install mkdocs-material

# Set workdir
WORKDIR /imx6_build

# Add user bashrc
CMD source ~/.bashrc

# Build arguments, username and user id
ARG user
ARG userid

# If user passed no arguments, exit with an error
RUN if [ -z "$user" ]; then printf "\n\nuser argument not received\n\n"; exit -1; fi

RUN if [ -z "$userid" ]; then printf "\n\nuserid argument not received\n\n"; exit -1; fi


# Add user
RUN if [ "$user" != "root" ]; then useradd -u $userid $user; fi

# Run as user
USER $user
