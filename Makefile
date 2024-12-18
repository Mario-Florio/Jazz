CFLAGS = -m32 -fno-stack-protector -fno-builtin

all: clean kernel boot image

clean:
	rm -rf src/*.o

kernel:
	gcc $(CFLAGS) -c src/kernel.c -o src/kernel.o
	gcc $(CFLAGS) -c src/vga.c -o src/vga.o
	gcc $(CFLAGS) -c src/gdt.c -o src/gdt.o
	gcc $(CFLAGS) -c src/util.c -o src/util.o


boot:
	nasm -f elf32 src/boot.s -o src/boot.o
	nasm -f elf32 src/gdt.s -o src/gdts.o

image:
	ld -m elf_i386 -T src/linker.ld -o src/kernel src/boot.o src/kernel.o src/vga.o src/gdt.o src/gdts.o src/util.0
	mv kernel Star/boot/kernel
	grub-mkrescue -o kernel.iso Star
	rm src/*.o
