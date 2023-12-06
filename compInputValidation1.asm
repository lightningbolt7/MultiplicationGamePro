.data
.align 2


inputPrompt: .asciiz "\nEnter a number (1-9): "
newLine: .asciiz "/n"

.text
# t0 stores the users input
# t1 contains the random number from the bot
# t2 contains the multiplication of the inputs from both elements
# t3 has the flag to check for the same input, if its 1, then same element entered
# t5 has base address
# t6 stores the size of the array
# t7 stores the incrementor
# t8 stores value of each value in array every iteration

.globl compInputValidation
compInputValidation:
addi $sp, $sp, -4
sw $ra, 0($sp)

li $t4, 1
li $t6, 2

# Get user input
move $t0, $a0

inputLoop:
li $t3, 0 

la $t5,0($a2)
# Get input from bot
jal setRandom
move $t1, $v0

mul $t2, $t0, $t1
beq $t6,$zero,continue

li $t7,0
beq $t6,$zero,continue
	innerLoop:

		lw $t8,0($t5)
		beq $t2,$t8 setFlag
		addi $t5,$t5,4
		addi $t7,$t7,1
		slt $t9,$t7,$t6
		beq $t9,$zero,continue
		j innerLoop
continue:
beq $t3, $t4, wronginput

# Returns computer choice
move $v0, $t1
move $v1, $t2

move $t5, $a2
	loopFR:
		lw $t8, 0($t5)
		beq $t8,$zero,storeInput
		addi $t5,$t5,4
		j loopFR
	goBack:

lw $ra, 0($sp)

jr $ra

wronginput:
j inputLoop

setFlag:
li $t3,1
j continue
storeInput:
	sw $t2, 0($t5)
	j goBack
