doSwap:
	la    $t0, myArray
	li    $t1, 0
	li    $t2, 1
L:
	sltiu $t3, $t1, 11
	beq   $t3, $zero, finished
	sll   $t4, $t1, 2
	addu  $t5, $t0, $t4
	sll   $t4, $t2, 2
	addu  $t6, $t0, $t4
	lw    $t7, 0($t5)
	lw    $t4, 0($t6)
	sw    $t4, 0($t5)
	sw    $t7, 0($t6)
	addiu $t1, $t1, 2
	addiu $t2, $t2, 2
	j     L
