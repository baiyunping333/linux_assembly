section .data
	hello        db   'Hello,world',10
	hello_len    equ  $-hello
	error        db   'Fail to write',11
	error_len    equ  $-error

section .text     ; fill next registers
	global _start ; rax, rdi, rsi, rdx, r10, r8, r9

_start:           ; the stack has stored the program and parameter 
	pop rdi       ; argc(argument count)
	pop rdi       ; argv[1],the program name
	pop rdi       ; first parameter , a file name

	mov rax,85    ; 85 is sys_create(const char*, int mode)
			      ; const char* is already in rdi
	mov rsi,00644Q; read/write permissions in octal(rw_rw_rw_)
	syscall		  ; if create sucesses, rax will store file descriptor

	test rax,rax  ;lets make sure the file descriptor is valid
	js skip_write ;if file descriptor has the sign flag
				  ;which means it's less than 0, there was an oops
				  ;so skip writing. Otherwise call filewrite procedure
	call file_write

skip_write:
	mov rax,1         ; rax stores the call num, 1 means sys_write
	mov rdi,1		  ; 1 is stdout
	mov rsi,error     ; buff pointer
	mov rdx,error_len ; buff length
	syscall           ; int 80h
	call exit

file_write:      ; sys_write(unsigned int fd, const char *buf, size_t count)
	mov rdi, rax ; file descriptor is in rax
	mov rax, 1   ; 1 is sys_write
				 ; rdi is already set up  
	mov rsi, hello
	mov rdx, hello_len
	syscall
	call exit

exit:
	mov rax,60    ; system call 60 is exit
	xor rdi,rdi   ; exit code 0
	syscall       ; invoke operating system to exit
	
