#----------This is a demo for linux assembly-------------
#            2014-12-31 by Jeff Zhao @VIA
#----------Have a good time for searching----------------

#1. hello         : hello world in linux assembly.

#2. write_file_32 : a demo to write "Hello,World" to file, c
#				    can not run, it's just a demo.

#3. write_file_64 : usage, ./write_file_64 file_name

#4. puts          : use C library puts

#5. echo		  : like the echo in linux
  
#6. power         : like routine in C lib, power x y

#7. fib           : Fib Series

all: hello write_file_64 puts echo \
	 power fib

hello:
	nasm -f elf64 hello.asm
	ld -s -o hello hello.o # -s means strip

write_file_64:
	nasm -f elf64 write_file_64.asm
	ld -s -o write_file_64 write_file_64.o

puts:
	nasm -felf64 puts.asm
	gcc puts.o -o puts

echo:
	nasm -felf64 echo.asm
	gcc echo.o -o echo

power:
	nasm -felf64 power.asm
	gcc power.o -o power

fib:
	nasm -felf64 fib.asm
	gcc fib.o -o fib

clean:
	rm hello.o hello
	rm write_file_64.o write_file_64
	rm puts.o puts
	rm echo.o echo
	rm power.o power
	rm fib.o fib
