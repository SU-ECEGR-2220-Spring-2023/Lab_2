.data
    A: .word 0, 0, 0, 0, 0    # Empty memory region for 5 elements
    B: .word 1, 2, 4, 8, 16   # Initialized memory region with values

.text
.globl main
main:
    # Initialize registers
    la t0, A        # Load base address of A into t0
    la t1, B        # Load base address of B into t1
    li t2, 0        # Initialize i with 0

    # Loop 1: for(i=0; i<5; i++)
    li t3, 5        # Set loop condition to 5
loop1:
    beq t2, t3, exit_loop1
    slli t4, t2, 2 #shfiting based on bytes 0, 1, 2...
    add t4, t4, t0 #adds the byte  to the address of A
    slli t5, t2, 2 #shifting based on bytes 0,1,2...
    add t5, t5, t1 #adds the byte to the address of B
    lw s1, 0(t5)
    addi s1, s1, -1
    sw s1, 0(t4)
    addi t2, t2, 1
    j loop1
    
    
    
exit_loop1:
    addi t2, t2, -1           # Decrement i by 1
    
    # Loop 2: while(i >= 0)
loop2:
	blt t2, s0, exit_loop2
	slli t4, t2, 2
	add t4, t4, t0
	slli t5, t2, 2
	add t5, t5, t1
	lw s1, 0(t5)
	lw s2, 0(t4)
	add s3, s1, s2
	add s3, s3, s3
	sw s3, 0(t4)
	addi t2, t2, -1
	j loop2
	
	
	
exit_loop2:
	li a7, 10
