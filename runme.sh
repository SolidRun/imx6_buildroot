#!/bin/bash
set -e
echo "test one start .....................!!"

###################################################################################################################################
#                                                       Global environment

BUILDROOT_VERSION=2022.02.4

export ARCH=arm
export CROSS_COMPILE=$BASE_DIR/build/buildroot/output/host/bin/arm-linux-

BASE_DIR=`pwd`
mkdir -p $BASE_DIR/build

SHALLOW=${SHALLOW:false}
if [ "x$SHALLOW" == "xtrue" ]; then
        SHALLOW_FLAG="--depth 500"
fi

if [ "x$CUSTOM_CONFIG" == "x" ]; then
        CUSTOM_CONFIG=imx6_solidrun_base_defconfig
fi

REPO_PREFIX=`git log -1 --pretty=format:%h`

# Get number of jobs in this machine to use with make command
JOBS=$(getconf _NPROCESSORS_ONLN)

###################################################################################################################################
#                                                       INSTALL Packages

PACKAGES_LIST="git make mtools bison coreutils u-boot-tools gcc-arm-linux-gnueabihf gcc-arm-linux-gnueabi python3 python3-pyelftools libssl-dev build-essential device-tree-compiler bc unzip tar util-linux binutils e2fsprogs gawk wget diffstat texinfo chrpath sed g++ bash patch cpio rsync file python3-pip flex parted"
PACKAGES_LIST=""

set +e
for i in $PACKAGES_LIST; do

	#Check if package is installed
	dpkg -s $i > /dev/null  2>&1

	#If exit code is not 0 - package is not installed
	if [ $? -ne 0 ]; then

		echo "Package $i is not installed"
		echo "If using apt package manager, you can install this tool using:"
		echo "	sudo apt install $i"
		echo "You can install all needed packages using:"
		echo "	sudo apt install $PACKAGES_LIST"

		exit -1
	fi

done

###################################################################################################################################
#                                                       INSTALL Buildroot
set -e
if [[ ! -d $BASE_DIR/build/buildroot ]]; then
	cd $BASE_DIR/build
	git clone ${SHALLOW_FLAG} https://github.com/buildroot/buildroot -b $BUILDROOT_VERSION
fi

# Build buildroot
echo "*** Building buildroot"
cd $BASE_DIR/build/buildroot
cp $BASE_DIR/configs/$CUSTOM_CONFIG configs/imx6_solidrun_defconfig
make imx6_solidrun_defconfig
make

IMG=microsd-${REPO_PREFIX}.img
cp $BASE_DIR/build/buildroot/output/images/sdcard.img $BASE_DIR/images/${IMG}
echo -e "\n\n*** Image is ready - images/${IMG}"

##########
echo "Done....!!!!"
