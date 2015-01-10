;-----------------------------------------------------------------------
; write "Hello,world" to console using C library
;
; for compiling:
; nasm -felf64 puts.asm && gcc puts.o && ./a.out
;-----------------------------------------------------------------------

	global main
	extern puts
	section .text
main:					; This is called by C library stratup code
	mov rdi, message
	call puts
	ret
message:
	db	"Hello,world",0 ; Note strings must be ended with 0 in C
