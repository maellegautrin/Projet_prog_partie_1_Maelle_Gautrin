	.text
	.globl	main
main:
movsd val3(%rip), %xmm0
 		movsd %xmm0, -8(%rsp)
	movsd val2(%rip), %xmm0	
 		movsd -8(%rsp), %xmm1
		mulsd %xmm1, %xmm0
	call print_double
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
val2 : .double 2.
val3 : .double 4.
