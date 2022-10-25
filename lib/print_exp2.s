	.text
	.globl	main
main:
movsd (val2), %xmm0	movsd %xmm0, 0(%rbp)
movsd (val1), %xmm0	movsd -8(%rbp), %xmm1
	addsd %xmm1, %xmm0
	call print_float
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
