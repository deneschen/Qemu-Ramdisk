exec_dir=$(dirname $0)
$(realpath ${exec_dir})/bin/qemu-system-aarch64 \
	-machine virt \
	-cpu cortex-a57 \
	-machine type=virt \
	-nographic -m 2048 \
	-smp 4 \
	-bios /home/jun/uefi/Build/ArmVirtQemu-AARCH64/DEBUG_GCC5/FV/QEMU_EFI.fd \
	-kernel ~/linux/arch/arm64/boot/Image \
	-initrd ${exec_dir}/ramdisk.img \
	--append "rdinit=/linuxrc console=ttyAMA0"
