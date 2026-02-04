.data
prompt:   .asciiz "Enter number:\n"
maxstr:   .asciiz "Maximum: "
newline:  .asciiz "\n"

.text
main:
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
	beq $t3, $zero, keep_max12
	move $t4, $t1
keep_max12:

	slt $t3, $t4, $t2
	beq $t3, $zero, keep_max123
	move $t4, $t2
keep_max123:

	la  $a0, maxstr
	li  $v0, 4
	syscall

	li  $v0, 1
	move $a0, $t4
	syscall

	la  $a0, newline
	li  $v0, 4
	syscall

	li  $v0, 10
	syscall
