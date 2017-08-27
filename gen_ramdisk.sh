#!/bin/bash
current_dir=${PWD}
cd rootfs && find . | cpio -o -Hnewc | gzip -9 > ../ramdisk.img
