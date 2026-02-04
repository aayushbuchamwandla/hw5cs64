.text
main:
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 5
    syscall
    move $t1, $v0

    li $v0, 5
    syscall
    move $t2, $v0

    li $t3, 5
    mult $t1, $t3
    mflo $t4

    sub $t5, $t0, $t4

    sll $t6, $t5, 3

    sll $t7, $t2, 6

    add $a0, $t6, $t7

    li $v0, 1
    syscall

exit:
    li $v0, 10
    syscall
