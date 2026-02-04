.data

.text
main:
	li  $v0, 5
	syscall
	move $t0, $v0

	li  $v0, 5
	syscall
	move $t1, $v0

	li  $v0, 5
	syscall
	move $t2, $v0

	li   $t3, 5
	mult $t1, $t3
	mflo $t4

	sub  $t5, $t0, $t4
	sll  $t5, $t5, 3

	sll  $t6, $t2, 6

	add  $t7, $t5, $t6

	li  $v0, 1
	move $a0, $t7
	syscall

	li  $v0, 10
	syscall
