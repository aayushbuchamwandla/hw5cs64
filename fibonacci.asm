.data
prompt:     .asciiz "Enter a number:\n"
first:      .asciiz "The first "
numbers:    .asciiz " numbers in the Fibonacci series are:\n"
spacech:    .asciiz " "
newline:    .asciiz "\n"

.text
main:
	la  $a0, prompt
	li  $v0, 4
	syscall

	li  $v0, 5
	syscall
	move $t0, $v0

	li  $t5, 1
	slt $t6, $t5, $t0
	beq $t6, $zero, exit

	li  $t1, 1
	li  $t2, 1
	li  $t3, 2

	la  $a0, first
	li  $v0, 4
	syscall

	li  $v0, 1
	move $a0, $t0
	syscall

	la  $a0, numbers
	li  $v0, 4
	syscall

	li  $v0, 1
	move $a0, $t1
	syscall

	la  $a0, spacech
	li  $v0, 4
	syscall

	li  $v0, 1
	move $a0, $t2
	syscall

fib_loop:
	sltu $t6, $t3, $t0
	beq  $t6, $zero, exit

	addu $t4, $t1, $t2
	move $t1, $t2
	move $t2, $t4

	la  $a0, spacech
	li  $v0, 4
	syscall

	li  $v0, 1
	move $a0, $t4
	syscall

	addiu $t3, $t3, 1
	j fib_loop

exit:
	la  $a0, newline
	li  $v0, 4
	syscall

	li  $v0, 10
	syscall
