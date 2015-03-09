	.file	"simple_function.c"
	.text
	.globl	simple_l
	.type	simple_l, @function
simple_l:
.LFB0:
	.cfi_startproc
	movq	%rsi, %rax
	addq	(%rdi), %rax
	movq	%rax, (%rdi)
	ret
	.cfi_endproc
.LFE0:
	.size	simple_l, .-simple_l
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
