


.text
.globl updateGrid
updateGrid:
# t0 stores the base address
# t1 storess the max elements checker
# t2 acts as the incrementor
# t3 stores the value of the element in address $s0
# t4 ----> Anthony has to put the valid input multiplication here for it to track :D
# t5 ----> Anthony passes whose turn, 100 for player and 200 for bot :D
	la $t0, 0($a2)
	li $t2, 0
	li $t1, 35
	move $t4, $a0 # Sets $s4 to hold the product
	move $t5, $a1 # Sets $s5 to hold 100/200 depending on user or computer turn
Loop:
	lw $t3, 0($t0)
	beq $t3, $t4, goHereBro
	addi $t0, $t0, 4
	j Loop
	
goHereBro:
	sw $t5, 0($t0)
	jr $ra
	

