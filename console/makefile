console: console.o
	gcc -o console console.o -no-pie
console.o: console.asm
	nasm -f elf64 console.asm
