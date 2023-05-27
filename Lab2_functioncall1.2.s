# Function Calls

.data
    a:  .word 0
    b:  .word 0
    c:  .word 0

.text
.globl main

main:
    
    li t2, 0 #a
    li t3, 0 #b
    li t4, 0 #c
    li t0, 5 #i
    li t1, 10 #j
    add a0, t0, zero
    jal AddItUp
    add t2, a0, zero
    add a0, t1, zero
    jal AddItUp
    add t3, a0, zero
    add t4, t3, t2
    j next
    
    AddItUp:
    sw t1, 4(sp)
    sw t0, 0(sp)
    li t0, 0
    li t1, 0
    loop:
    	beq t0, a0, leaveloop
    	addi t1, t1, 1
    	add t1, t1, t0
    	addi t0, t0, 1
    j loop
    
    leaveloop:
    add a0, t1, zero
    lw t0, 0(sp)
    lw t1, 4(sp)
    addi sp, sp, 8
    jr ra
    
    
    next:
    li a7, 10
    
    	



