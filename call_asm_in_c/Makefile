#----------This is a demo for linux assembly-------------
#            2014-12-31 by Jeff Zhao @VIA
#----------Have a good time for searching----------------

all: hello

hello: main.o max_of_three.o
	gcc main.o max_of_three.o -o hello

main.o:
	gcc -c main.c

max_of_three.o:
	nasm -f elf64 max_of_three.asm

clean:
	rm hello 
	rm *.o
