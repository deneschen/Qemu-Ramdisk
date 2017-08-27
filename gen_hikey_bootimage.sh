#!/bin/bash
# 在内核源码目录下执行此脚本
# ANDROID_TOPDIR 指定Andorid源码树的位置
# KERNEL 指定Image + dtb的镜像位置
# RAMDISK 指定ramdisk.img的位置
#

ANDROID_TOPDIR=~/aosp
KERNEL=./Image-dtb
RAMDISK=~/Qemu-Ramdisk/ramdisk.img
#RAMDISK=${ANDROID_TOPDIR}/out/target/product/hikey/ramdisk.img

ncpus=$(grep -c ^processor /proc/cpuinfo)
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
make defconfig -j${ncpus}
make Image hisilicon/hi6220-hikey.dtb -j${ncpus}
cat arch/arm64/boot/Image arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb >./Image-dtb

# for andorid
#cmdline="console=ttyFIQ0 \
#androidboot.console=ttyFIQ0 \
#androidboot.hardware=hikey \
#firmware_class.path=/system/etc/firmware \
#efi=noruntime \
#printk.devkmsg=on \
#buildvariant=userdebug"

# for hikey 6220 kernel mini rootfs
cmdline="console=ttyAMA3,115200 root=/init"

export PATH=${ANDROID_TOPDIR}/system/core/mkbootimg/:$PATH
mkbootimg	--kernel ${KERNEL} \
		--ramdisk ${RAMDISK} \
		--cmdline "${cmdline}" \
		--os_version P \
		--os_patch_level 2017-08-05 \
		--output boot.img \
