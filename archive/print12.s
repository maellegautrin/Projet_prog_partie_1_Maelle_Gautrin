	.text
	.globl	main
main:
	movq $12, %rdi
	movq $56, %rsi
	imulq %rsi, %rdi
	movq %rdi, %rax
	call print_int
	ret

    print_int:
        movq %rdi, %rsi
        movq $S_int,%rdi
        xorq %rax, %rax
        call printf 
        ret
        	.data
S_int:
	.string "%d"
