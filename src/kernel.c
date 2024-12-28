#include "vga.h"
#include "gdt.h"
#include "interrupts/idt.h"

void kmain(void);

void kmain(void) {
	initGdt();
	print("Hello, welcome to Star!\r\n");
	initIdt();
}
