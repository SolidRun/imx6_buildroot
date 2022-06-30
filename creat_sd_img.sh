#!/bin/bash
set -e

###################################################################################################################################
#                                                       Global environment

BASE_DIR=`pwd`

REPO_PREFIX=`git log -1 --pretty=format:%h`

###################################################################################################################################
#                                                       Create disk images

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
echo "        fdtdir ../boot/dtbs/" >> $BASE_DIR/images/extlinux.conf
echo "        initrd ../boot/rootfs.cpio" >> $BASE_DIR/images/extlinux.conf
echo "        append root=/dev/mmcblk1p2 rootwait" >> $BASE_DIR/images/extlinux.conf
mmd -i tmp/part1.fat32 ::/extlinux
mcopy -i tmp/part1.fat32 $BASE_DIR/images/extlinux.conf ::/extlinux/extlinux.conf
mmd -i tmp/part1.fat32 ::/boot
mcopy -i tmp/part1.fat32 $BASE_DIR/images/tmp/zImage ::/boot/zImage
mcopy -s -i tmp/part1.fat32 $BASE_DIR/images/tmp/*.dtb ::/boot/
mcopy -s -i tmp/part1.fat32 $BASE_DIR/build/buildroot/output/images/rootfs.cpio ::/boot/rootfs.cpio

dd if=/dev/zero of=${IMG} bs=1M count=301
# Copy u-boot stuff
dd if=$BASE_DIR/images/tmp/SPL of=${IMG} bs=1k seek=1 conv=notrunc
dd if=$BASE_DIR/images/tmp/u-boot.img of=${IMG} bs=1k seek=69 conv=notrunc
env PATH="$PATH:/sbin:/usr/sbin" parted --script ${IMG} mklabel msdos mkpart primary 2MiB 150MiB mkpart primary 150MiB 300MiB
dd if=tmp/part1.fat32 of=${IMG} bs=1M seek=2 conv=notrunc
# File System
dd if=$BASE_DIR/build/buildroot/output/images/rootfs.ext2 of=${IMG} bs=1M seek=150 conv=notrunc

echo -e "\n\n*** Image is ready - images/${IMG}"
