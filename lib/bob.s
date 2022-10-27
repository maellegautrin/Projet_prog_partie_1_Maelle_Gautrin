	.text
	.globl	main
main:
	movq $3, %rax
	pushq %rax
	movq $4, %rax
	pushq %rax
	movq $2, %rax
	movq $1, %rdx
	movq %rax, %rsi
	popq %rax
	idivq %rsi
	popq %rcx
	addq %rcx, %rax
	call  print_int
	ret

        print_int:
            movq %rax, %rsi
            movq $S_int,%rdi
            xorq %rax, %rax
            call printf
            ret
        
        print_double:
            mov $S_float, %rdi
            mov $1, %rax
            call printf 
            ret
	.data
S_int:
	.string "%d"
S_float:
	.string "%lf"
