# Loops

	.data
Z:	.word	2
i:	.word	0

	.text

main:
	lw s1, Z
	lw s2, i
	addi t0, s0, 20
	addi t1, s0, 100
	addi t2, s0, -1
	
	for:
	bgt s2, t0, do
	addi s2, s2, 2
	li s3, 1
	add s1, s1, s3
	j for
	
	do:
	beq  s1, t1, while
	add s1, s1, s3
	j do
	
	while:
	beq s2, s0, exit
	add s1, s1, t2
	add s2, s2, t2
	j while
	
	exit:
	li a7, 10
	ecall