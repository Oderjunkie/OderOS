.PHONY: all efi disk

all: efi disk

CFLAGS = -ffreestanding -Isrc/gnu-efi/inc -Isrc/gnu-efi/inc/x86_64 -Isrc/gnu-efi/inc/protocol -c
LDFLAGS = -nostdlib -Wl,-dll -shared -Wl,--subsystem,10 -e efi_main

efi : src/*.c
	gcc ${CFLAGS} -o src/hello.o src/hello.c
	gcc ${CFLAGS} -o src/data.o src/gnu-efi/lib/data.c
	gcc ${LDFLAGS} -o EFI/BOOT/BOOTX64.EFI src/hello.o src/data.o

disk : src/*.c
	dd if=/dev/zero of=out.img bs=1k count=1440
	xorriso -outdev out.img -blank as_needed -map EFI /EFI -volid "ANONYMOS"