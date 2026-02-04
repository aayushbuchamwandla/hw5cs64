.data
    prompt: .asciiz "Enter number:\n"
    max_label: .asciiz "Maximum: "
    newline: .asciiz "\n"

.text
main:
    la $a0, prompt
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    bgez $t0, skip_abs1
    sub $t0, $zero, $t0
skip_abs1:

    la $a0, prompt
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t1, $v0
    bgez $t1, skip_abs2
    sub $t1, $zero, $t1
skip_abs2:

    la $a0, prompt
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t2, $v0
    bgez $t2, skip_abs3
    sub $t2, $zero, $t2
skip_abs3:

    move $t4, $t0
    bge $t4, $t1, next_comp
    move $t4, $t1
next_comp:
    bge $t4, $t2, print_res
    move $t4, $t2

print_res:
    la $a0, max_label
    li $v0, 4
    syscall
    move $a0, $t4
    li $v0, 1
    syscall
    la $a0, newline
    li $v0, 4
    syscall

exit:
    li $v0, 10
    syscall
