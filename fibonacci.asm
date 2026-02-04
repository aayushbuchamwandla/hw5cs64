.data
    prompt:     .asciiz "Enter a number:\n"
    first:      .asciiz "The first "
    numbers:    .asciiz " numbers in the Fibonacci series are:\n"
    spacech:    .asciiz " "
    newline:    .asciiz "\n"
	
.text
main:
    la $a0, prompt
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t0, $v0 
	
    li $t1, 1 
    li $t2, 1 
    li $t3, 2 

    ble $t0, 1, exit

    la $a0, first
    li $v0, 4
    syscall
    move $a0, $t0
    li $v0, 1
    syscall
    la $a0, numbers
    li $v0, 4
    syscall

    li $a0, 1
    li $v0, 1
    syscall
    la $a0, spacech
    li $v0, 4
    syscall
    li $a0, 1
    li $v0, 1
    syscall

loop:
    bge $t3, $t0, exit
    add $t4, $t1, $t2 
    move $t1, $t2     
    move $t2, $t4     
	
    la $a0, spacech
    li $v0, 4
    syscall
    move $a0, $t4
    li $v0, 1
    syscall
	
    addi $t3, $t3, 1
    j loop

exit:
    la $a0, newline
    li $v0, 4
    syscall

    li $v0, 10
    syscall
