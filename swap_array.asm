# ... (original code above) ...
# COPYFROMHERE - DO ___NOT___ REMOVE THIS LINE

doSwap:
        # TODO: translate the following C/C++ code 
        # into MIPS assembly here.
        # Use only regs $v0-$v1, $t0-$t7, $a0-$a3.
        # You may assume nothing about their starting values.
        #
        #
        # unsigned int x = 0; 
        # unsigned int y = 1; 
        # while (x < 11) { 
        #    int temp = myArray[x]; 
        #    myArray[x] = myArray[y]; 
        #    myArray[y] = temp; 
        #    x+=2; 
        #    y+=2; 
        # }

        # TODO: fill in the assembly code here:
        li $t0, 0        # x = 0
        li $t1, 1        # y = 1
        la $t2, myArray  # base address

swap_loop:
        li $t3, 11
        bge $t0, $t3, finished
        
        # Calculate address of myArray[x]
        sll $t4, $t0, 2
        addu $t4, $t4, $t2
        
        # Calculate address of myArray[y]
        sll $t5, $t1, 2
        addu $t5, $t5, $t2
        
        # Load values
        lw $t6, 0($t4)   # temp = myArray[x]
        lw $t7, 0($t5)   # val_y = myArray[y]
        
        # Store swapped values
        sw $t7, 0($t4)   # myArray[x] = val_y
        sw $t6, 0($t5)   # myArray[y] = temp
        
        # Increment indices
        addi $t0, $t0, 2
        addi $t1, $t1, 2
        j swap_loop

finished:
        # do ___NOT___ remove this last line
        jr $ra
