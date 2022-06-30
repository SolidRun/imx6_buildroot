#!/bin/bash
set -e
echo "test one start .....................!!"

###################################################################################################################################
#                                                       Global environment

BUILDROOT_VERSION=2020.08.1

export ARCH=arm
export CROSS_COMPILE=$BASE_DIR/build/buildroot/output/host/bin/arm-linux-

BASE_DIR=`pwd`
mkdir -p $BASE_DIR/build

SHALLOW=${SHALLOW:false}
if [ "x$SHALLOW" == "xtrue" ]; then
        SHALLOW_FLAG="--depth 500"
fi

REPO_PREFIX=`git log -1 --pretty=format:%h`

# Get number of jobs in this machine to use with make command
JOBS=$(getconf _NPROCESSORS_ONLN)

###################################################################################################################################
#                                                       INSTALL Packages

PACKAGES_LIST="git make mtools bison coreutils u-boot-tools gcc-arm-linux-gnueabihf gcc-arm-linux-gnueabi python3 python3-pyelftools libssl-dev build-essential device-tree-compiler bc unzip tar util-linux binutils e2fsprogs gawk wget diffstat texinfo chrpath sed g++ bash patch cpio rsync file python3-pip flex parted"

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
cp $BASE_DIR/configs/imx6_solidrun_defconfig configs/imx6_solidrun_defconfig
make imx6_solidrun_defconfig
make

cd $BASE_DIR/build/buildroot/output/images/
cp imx6dl-cubox-i-emmc-som-v15.dtb imx6dl-cubox-i-emmc.dtb
cp imx6dl-hummingboard-emmc-som-v15.dtb imx6dl-hummingboard-emmc.dtb
cp imx6q-cubox-i-emmc-som-v15.dtb imx6q-cubox-i-emmc.dtb
cp imx6q-hummingboard-emmc-som-v15.dtb imx6q-hummingboard-emmc.dtb
cp imx6dl-hummingboard2-emmc-som-v15.dtb imx6dl-hummingboard2-emmc.dtb
cp imx6q-hummingboard2-emmc-som-v15.dtb imx6q-hummingboard2-emmc.dtb

###################################################################################################################################
#                                                       Create disk images

#echo "creat_sd_img.sh ot generate the sd image \"images/microsd-${REPO_PREFIX}.img\""
#exit 0

echo "*** Creating disk images"
mkdir -p $BASE_DIR/images/tmp/
cd $BASE_DIR/images
dd if=/dev/zero of=tmp/part1.fat32 bs=1M count=148
env PATH="$PATH:/sbin:/usr/sbin" mkdosfs tmp/part1.fat32

IMG=microsd-${REPO_PREFIX}.img
cp $BASE_DIR/build/buildroot/output/images/rootfs.cpio $BASE_DIR/build/buildroot/output/images/zImage $BASE_DIR/build/buildroot/output/images/*.dtb $BASE_DIR/build/buildroot/output/images/SPL $BASE_DIR/build/buildroot/output/images/u-boot.img $BASE_DIR/images/tmp/

# Create extlinux.conf boot file
echo "label linux" > $BASE_DIR/images/extlinux.conf
echo "        linux ../boot/zImage" >> $BASE_DIR/images/extlinux.conf
echo "        fdtdir ../boot/" >> $BASE_DIR/images/extlinux.conf
echo "        initrd ../boot/rootfs.cpio" >> $BASE_DIR/images/extlinux.conf
echo "        append root=/dev/mmcblk1p2 rootwait" >> $BASE_DIR/images/extlinux.conf
mmd -i tmp/part1.fat32 ::/extlinux
mcopy -i tmp/part1.fat32 $BASE_DIR/images/extlinux.conf ::/extlinux/extlinux.conf
mmd -i tmp/part1.fat32 ::/boot
mcopy -i tmp/part1.fat32 $BASE_DIR/images/tmp/zImage ::/boot/zImage
mcopy -s -i tmp/part1.fat32 $BASE_DIR/images/tmp/*.dtb ::/boot/
mcopy -s -i tmp/part1.fat32 $BASE_DIR/build/buildroot/output/images/rootfs.cpio ::/boot/rootfs.cpio

dd if=/dev/zero of=${IMG} bs=1M count=351

env PATH="$PATH:/sbin:/usr/sbin" parted --script ${IMG} mklabel msdos mkpart primary 2MiB 150MiB mkpart primary 150MiB 350MiB
dd if=tmp/part1.fat32 of=${IMG} bs=1M seek=2 conv=notrunc
# File System
dd if=$BASE_DIR/build/buildroot/output/images/rootfs.ext2 of=${IMG} bs=1M seek=150 conv=notrunc
# Copy u-boot stuff
dd if=$BASE_DIR/images/tmp/SPL of=${IMG} bs=1k seek=1 conv=notrunc
dd if=$BASE_DIR/images/tmp/u-boot.img of=${IMG} bs=1k seek=69 conv=notrunc

echo -e "\n\n*** Image is ready - images/${IMG}"

##########
echo "Done....!!!!"
