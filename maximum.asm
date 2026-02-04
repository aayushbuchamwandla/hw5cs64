# maximum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum absolute value (e.g., entering -3, 2, 1 will give the answer 3)
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

prompt:     .asciiz "Enter the next number:\n"
newline:    .asciiz "\n"

#Text Area (i.e. instructions/code directive)
.text

main:

	# TODO: Write your code here
    # You can have other labels expressed here, if you need to

        la  $a0, prompt
        li  $v0, 4
        syscall
        li  $v0, 5
        syscall
        move $t0, $v0

        la  $a0, prompt
        li  $v0, 4
        syscall
        li  $v0, 5
        syscall
        move $t1, $v0

        la  $a0, prompt
        li  $v0, 4
        syscall
        li  $v0, 5
        syscall
        move $t2, $v0

        slt $t3, $t0, $zero
        beq $t3, $zero, abs1_done
        subu $t0, $zero, $t0
abs1_done:

        slt $t3, $t1, $zero
        beq $t3, $zero, abs2_done
        subu $t1, $zero, $t1
abs2_done:

        slt $t3, $t2, $zero
        beq $t3, $zero, abs3_done
        subu $t2, $zero, $t2
abs3_done:

        move $t4, $t0

        slt $t3, $t4, $t1
        beq $t3, $zero, keep1
        move $t4, $t1
keep1:

        slt $t3, $t4, $t2
        beq $t3, $zero, keep2
        move $t4, $t2
keep2:

        li  $v0, 1
        move $a0, $t4
        syscall

        la  $a0, newline
        li  $v0, 4
        syscall

exit:
	# TODO: Write code to properly exit a SPIM simulation

        li  $v0, 10
        syscall
