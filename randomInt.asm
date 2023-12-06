.globl setRandom

.text
setRandom:
	li $v0, 42 # 42 is code to generate a random int
	li $a1, 8 # Set upper bound to 9
	add $a0, $zero, 1 # Set lowerbound to 1
	syscall
	add $v0, $zero, $a0 # Store factor in $v0
	addi $v0,$v0,1
	jr $ra
