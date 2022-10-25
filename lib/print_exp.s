	.text
	.globl	main
main:
	movq $3, %rax
	pushq %rax
	movq $2, %rax
	pushq %rax
	movq $3, %rax
	popq %rcx
	addq %rcx, %rax
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
            mov $S_int, %rdi
            mov $1, %rax
            call printf 
            ret
	.data
S_int:
	.string "%d"
