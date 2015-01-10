all: sum

sum: main.o sum.o
	gcc main.o max_of_three.o -o sum
main.o:
	gcc -c main.c
sum.o:
	nasm -felf64 sum.asm

clean:
	rm main.o sum.o sum
