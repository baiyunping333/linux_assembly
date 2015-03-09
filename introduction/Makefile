# this is a introduction to linux assembly
# those are some demos for you to learn
# Jeff @ VIA
# 2015-2-5

all: hello_att hello_intel args inline

hello_att:
	gcc hello.s -o hello_att
hello_intel:
	nasm -f elf64 hello.asm
	ld -s -o hello_intel hello.o
args:
	gcc -m32 args.s -o args
inline:
	gcc -m32 inline.c -o inline
clean:
	rm -f hello_att hello_intel hello_intel.o args inline
	  
