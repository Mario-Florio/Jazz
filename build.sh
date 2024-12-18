
gcc -m32 -fno-stack-protector -fno-builtin -c kernel.c -o kernel.o

gcc -m32 -fno-stack-protector -fno-builtin -c vga.c -o vga.o

nasm -f elf32 boot.s -o boot.o

ld -m elf_i386 -T linker.ld -o kernel boot.o kernel.o vga.o

mv kernel Star/boot/kernel

grub-mkrescue -o Star.iso Star/

echo 'Run "qemu-system-i386 Star.iso" to boot'

