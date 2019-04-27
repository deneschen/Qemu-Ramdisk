# Qemu-Ramdisk

Qemu and busybox rootfs for arm and aarch64

/home/jun/QEMU/Qemu-Ramdisk/rootfs

```shell
sudo apt-get install libcap-dev
sudo apt-get install libattr1
sudo apt-get install libattr1-dev
./configure --prefix=/home/jun/QEMU/qemu/out --target-list=aarch64-softmmu,arm-softmmu,mips-softmmu,mips64-softmmu,mips64el-softmmu,mipsel-softmmu,riscv32-softmmu,riscv64-softmmu,aarch64-linux-user,aarch64_be-linux-user,arm-linux-user,armeb-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,mipsn32-linux-user,mipsn32el-linux-user,riscv32-linux-user,riscv64-linux-user --enable-virtfs
```
