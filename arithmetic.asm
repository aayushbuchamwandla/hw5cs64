# arithmetic.asm program
# CS 64, Z.Matni

.text
main:
    # Get a
    li $v0, 5
    syscall
    move $t0, $v0 # $t0 = a

    # Get b
    li $v0, 5
    syscall
    move $t1, $v0 # $t1 = b

    # Get c
    li $v0, 5
    syscall
    move $t2, $v0 # $t2 = c

    # Calculate 5 * b using mult (the one allowed mult)
    li $t3, 5
    mult $t1, $t3
    mflo $t4      # $t4 = 5b

    # Calculate (a - 5b)
    sub $t5, $t0, $t4 # $t5 = a - 5b

    # Calculate 8 * (a - 5b) using shift
    sll $t6, $t5, 3   # $t6 = (a - 5b) * 2^3

    # Calculate 64 * c using shift
    sll $t7, $t2, 6   # $t7 = c * 2^6

    # Final result
    add $a0, $t6, $t7

    # Print result
    li $v0, 1
    syscall

exit:
    li $v0, 10
    syscall
