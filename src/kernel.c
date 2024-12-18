#include "vga.h"
#include "gdt.h"

void kmain(void);

void kmain(void) {
	initGdt();
	print("Hello, Star!\r\n");
}
