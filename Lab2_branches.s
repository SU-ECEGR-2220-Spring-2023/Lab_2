# Branches

	.data
A:	.word	15
B:	.word	15
C:	.word	10
Z:	.word	0
	.text
main:
	lw 	t0, A
	lw 	t1, B
	lw 	t2, C
	lw	t3, Z
	
	beq	t0, t1, L5
	bgt	t0, t1, L1 # compare A>B, branch to L1 if A>B
	li 	t4, 5
	bgt	t2, t4, L2 # compare C<5, branch to L2 if C<5
	j	default
	
	
	
	
	L1:
		bgt	t0, t1, L3 # compare A>B again, branch to L1 if A>B
		li	t5, 1
		add	t2, t2, t5
		li	t6, 7
		beq	t2, t6, L3
		addi	t3, t3, 3
		j	case3
	
	
	L2:
		addi t3, t3, 1
		j case1
	
	L3:
		addi t3, t3, 2
		j case2
	
	L4: 
		addi	t3, t3, 3
		j	case3
		
	L5:
		li	t5, 1
		add	t2, t2, t5
		li	t6, 7
		beq	t2, t6, L3
		j	L4
		
	case1:
		addi t3, t3, -2
		sw t3, Z, s1
		li a7, 10
		ecall
	
	case2:  
		addi t3, t3, -4
		sw t3, Z, s1
		li a7, 10
		ecall
		
	
	case3:  
		addi t3, t3, -6
		sw t3, Z, s1
		li a7, 10
		ecall
	
	
	default:
		sw t3, Z, s1
		li a7, 10
		ecall
		
