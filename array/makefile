array: array.o
	gcc -o array array.o -no-pie
array.o: array.asm
	nasm -f elf64 -g -F dwarf array.asm -l array.lst
