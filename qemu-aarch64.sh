${PWD}/bin/qemu-system-aarch64 -machine virt -cpu cortex-a57 -machine type=virt -nographic -m 2048 -smp 4 -kernel ~/linux/arch/arm64/boot/Image --append "rdinit=/linuxrc console=ttyAMA0"
