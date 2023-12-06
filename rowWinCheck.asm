.data
WIN_PROMPT: .asciiz "You Won :D"
LOSE_PROMPT: .asciiz "You lost to a bot wth!?"
.text

.globl rowWinCheck

rowWinCheck:
	la $t0, 0($a0) # Loads address into $t0
	li $t1, 0 # win condition counter
	move $t4,$a1
	li $t7, 0 # to check for the only first 2 values
	li $s0, 2 # limit checker
	li $s5, 6 # S1 STORES THE CONSTANT VALUE OF NUMBER OF ELEMENTS IN A ROW
	li $s2, 4 # win cindition checker
	li $s3, 35
	li $s4, 0
outerLoop:
	bgt $t7, $s0, skip
	la $t2, 0($t0)
	
	innerLoop:
		lw $t3, 0($t2)
		bne $t3,$t4,out
		addi $t1,$t1,1
		addi $t2,$t2,4
		beq $t1,$s2,win
		j innerLoop
		
	skip:
		beq $t7,$s5,offset
	
continue:
	li $t1,0
	addi $t7,$t7,1
	addi $t0,$t0,4
	addi $s4,$s4,1
	beq $s3,$s4,exit
	j outerLoop

out:
	j continue
offset:
	li $t7,0
	j continue
win:

	li $s3,'X'
	bne $t4,$s3,lose
	
	jal winningSound
	jal youWin

	li $v0,10
	syscall
exit:
	jr $ra
lose:
	jal losingSound
	jal youLose
	
	li $v0,10
	syscall
	j exit
