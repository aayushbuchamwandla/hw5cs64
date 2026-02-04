# arithmetic.asm program
# CS 64, Z.Matni
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 16*( a - 8*b) + 7*c using only one mult instruction
# 3. Print out the result

.data
newline: .asciiz "\n"

.text
main:
	# TODO: Write your code here!

        li  $v0, 5
        syscall
        move $t0, $v0

        li  $v0, 5
        syscall
        move $t1, $v0

        li  $v0, 5
        syscall
        move $t2, $v0

        sll $t3, $t1, 3
        sub $t4, $t0, $t3

        sll $t4, $t4, 4

        li   $t5, 7
        mult $t2, $t5
        mflo $t6

        add  $t7, $t4, $t6

        li  $v0, 1
        move $a0, $t7
        syscall

        li  $v0, 4
        la  $a0, newline
        syscall

exit:
	# Exit SPIM: Write your code here!

        li  $v0, 10
        syscall
