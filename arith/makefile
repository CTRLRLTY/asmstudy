arith: arith.o
	gcc -o arith arith.o -no-pie
arith.o: arith.asm
	nasm -f elf64 -g -F dwarf arith.asm -l arith.lst
