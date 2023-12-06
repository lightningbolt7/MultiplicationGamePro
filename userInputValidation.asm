.data
.align 2

sameInput: .asciiz "alr bro thats literally the same input, Try again :D : "

inputPrompt: .asciiz "\nEnter a number (1-9): "
newLine: .asciiz "/n"

.text
# t0 stores the users input
# t1 contains the random number from the bot
# t2 contains the multiplication of the inputs from both elements
# t3 has the flag to check for the same input, if its 1, then same element entered
# t4 stores the value  1 to act as a flag
# t5 has base address
# t6 stores the size of the array
# t7 stores the incrementor
# t8 stores value of each value in array every iteration
# a1 gets the broStoresInput base address
.globl userInputValidation
userInputValidation:
	# Get input from bot from main
	move $t1, $a0
	li $s7,9
	li $t4, 1
	li $t6, 2
	li $v0, 4
	la $a0, inputPrompt
	syscall

inputLoop:
	li $t3, 0
	li $v0, 5 # Gets user input
	syscall 
	bgt $v0,$s7,wronginput

	addi $t0, $v0, 0 # Sets user input into register $t0

	mul $t2, $t0, $t1 # Finds the product from the user's choice and stores in $t2
	beq $t6, $zero, continue # If 
	move $t5, $a1 # Loads address of user product choice array into $t5
	li $t7, 0 # Load size of incrementor to 0
	beq $t6, $zero, continue 
	
innerLoop:
	lw $t8, 0($t5)
	beq $t2, $t8, setFlag # If product exists already, go to set flag
	addi $t5, $t5, 4 # 
	addi $t7, $t7, 1
	slt $t9, $t7, $t6
	beq $t9, $zero, continue
	j innerLoop
	
continue:
	beq $t3, $t4, wronginput # If flag is marked, go to wronginput

	
	
	add $v0, $zero, $t0 # Store user input in $v0
	add $v1, $zero, $t2 # Stores the user's product in $v1 

	move $t5, $a1
	loopFR:
		lw $t8, 0($t5)
		beq $t8,$zero,storeInput
		addi $t5,$t5,4
		j loopFR
	goBack:

		jr $ra

wronginput:
	li $v0, 4
	la $a0, sameInput
	syscall
	j inputLoop

setFlag:
	li $t3, 1
	j continue
storeInput:
	sw $t2, 0($t5)
	j goBack
