.data
column: .asciiz "|"
row: .asciiz "-----------------------------"
SelectionBar: .word 1 2 3 4 5 6 7 8 9
enterSpace: .asciiz " "
newLine: .asciiz "\n"
xWord: .asciiz "X"
oWord: .asciiz "O"
.text
.globl printGrid
printGrid:
	la $t0, 0($a0)
	li $t1, 0
	li $t3, 0
	li $t4, 6
	li $t5, 36
	li $t7,10
     
loop:
	li $t6, 88
	li $v0, 4
	la $a0, column
	syscall
    	lw $t2, 0($t0)
    	beq $t2,$t6, xJump
    	li $t6, 79
    	beq $t2, $t6, oJump
    	blt $t2, $t7,space
    	continue:
    	addi $t0, $t0, 4
    	addi $t3, $t3, 1
   	li $v0, 1
    	move $a0, $t2  # Use move instead of la
    	syscall
       	goHere:
   	addi $t1, $t1, 1  # Increment column count
   	 
	li $v0, 4
	la $a0, column
	syscall
	li $v0, 4
	la $a0, enterSpace
	syscall
    	beq $t1, $t4, new  # If column count equals number of columns, move to the next row
    	j loop

new:

    	li $v0, 4
    	la $a0, newLine
    	syscall
	li $v0, 4
	la $a0, row
	syscall
	li $v0, 4
    	la $a0, newLine
    	syscall
    	li $t1, 0  # Reset column count
   	beq $t3, $t5, exit  # If all rows printed, exit
    	j loop

exit:
   	jr $ra

space:
	li $v0, 4
	la $a0, enterSpace
	syscall
	j continue
xJump:
	li $v0, 4
	la $a0, enterSpace
	syscall
	li $v0, 4
	la $a0, xWord
	syscall
	blt $t2, $t7, space
	addi $t0, $t0, 4
    	addi $t3, $t3, 1
	j goHere
oJump:
	li $v0, 4
	la $a0, enterSpace
	syscall
	li $v0, 4
	la $a0, oWord
	syscall
	blt $t2, $t7,space
	addi $t0, $t0, 4
    	addi $t3, $t3, 1
	j goHere
