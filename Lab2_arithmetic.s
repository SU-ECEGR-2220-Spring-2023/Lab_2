# Arithmetic
	.data
z:	.word 	0
	.text
main:
	lw	a1, z
	addi a2, a0, 15 #a
	addi a3, a0, 10 #b
	addi a4, a0, 5 #c
	addi a5, a0, 2 #d
	addi a6, a0, 18 #e
	addi a7, a0, -3 #f
	
	sub s2, a2, a3
	mul s3, a4, a5
	sub s4, a6, a7
	div s5, a2, a4
	
	add a1, a1, s2
	add a1, a1, s3
	add a1, a1, s4
	sub a1, a1, s5
	
	sw a1, z, t2
	
	
	