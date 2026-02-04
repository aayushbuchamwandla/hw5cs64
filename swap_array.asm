.data
incorrect:  .asciiz "---TEST FAILED---\n"
before:     .asciiz "Before:\n"
after:      .asciiz "After:\n"
comma:      .asciiz ", "
newline:    .asciiz "\n"
        
expectedMyArray:
        .word 17 29 20 27 22 25 24 23 26 21 28 19
myArray:
        .word 29 17 27 20 25 22 23 24 21 26 19 28

.text
printArray: 
        la $t0, myArray
        li $v0, 1
        lw $a0, 0($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall
        li $v0, 1
        lw $a0, 4($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall
        li $v0, 1
        lw $a0, 8($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall
        li $v0, 1
        lw $a0, 12($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall
        li $v0, 1
        lw $a0, 16($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall
        li $v0, 1
        lw $a0, 20($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall
        li $v0, 1
        lw $a0, 24($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall
        li $v0, 1
        lw $a0, 28($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall
        li $v0, 1
        lw $a0, 32($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall
        li $v0, 1
        lw $a0, 36($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall
        li $v0, 1
        lw $a0, 40($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall
        li $v0, 1
        lw $a0, 44($t0)
        syscall
        li $v0, 4
        la $a0, newline
        syscall
        jr $ra
        
checkArrays:  
        la $t0, expectedMyArray
        la $t1, myArray
        addiu $t2, $t0, 44

checkArrays_loop:  
        slt $t3, $t0, $t2
        beq $t3, $zero, checkArrays_exit
        lw $t4, 0($t0)
        lw $t5, 0($t1)
        bne $t4, $t5, checkArrays_nonequal
        addiu $t0, $t0, 4
        addiu $t1, $t1, 4
        j checkArrays_loop
        
checkArrays_nonequal: 
        li $v0, 0
        jr $ra
        
checkArrays_exit: 
        li $v0, 1
        jr $ra
        
main:   
        la $a0, before
        li $v0, 4
        syscall
        jal printArray
        jal doSwap
        la $a0, after
        li $v0, 4
        syscall
        jal printArray
        jal checkArrays
        beq $v0, $zero, main_failed
        j main_exit
        
main_failed: 
        la $a0, incorrect
        li $v0, 4
        syscall
        
main_exit:      
        li $v0, 10
        syscall

doSwap:
        li $t0, 0
        li $t1, 1
        la $t2, myArray
        li $t3, 11

swap_loop:
        bge $t0, $t3, finished 
        sll $t4, $t0, 2      
        addu $t4, $t4, $t2   
        sll $t5, $t1, 2      
        addu $t5, $t5, $t2   
        lw $t6, 0($t4)       
        lw $t7, 0($t5)       
        sw $t7, 0($t4)       
        sw $t6, 0($t5)       
        addi $t0, $t0, 2     
        addi $t1, $t1, 2     
        j swap_loop

finished:
        jr $ra
