sframe: sframe.o
	gcc -g -o sframe sframe.o -no-pie
sframe.o: sframe.asm
	nasm -f elf64 -g -F dwarf sframe.asm -l sframe.lst
