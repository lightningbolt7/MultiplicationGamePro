.data
WIN_PROMPT: .asciiz "YOU WON!! :D"
LOSE_PROMPT: .asciiz "You lost to a bot wth!?"
.text
.globl columnWinCheck

columnWinCheck:
	la $t0, 0($a0) # Loads address into $t0
	li $t1, 0 # win condition counter
	move $t4,$a1
	li $t7, 0 # to check for the only first 2 values
	li $s4, 0
outerLoop:
	la $t2,0($t0)
	innerLoop:
		lw $t3, 0($t2)
		bne $t3, $t4, out
		addi $t1,$t1, 1
		addi $t2,$t2, 24
		beq $t1, 4, win
		j innerLoop
	
	continue:
		li $t1,0
		addi $t7,$t7,1
		addi $t0,$t0,4
		addi $s4,$s4,1
		beq $s4, 18, exit
		j outerLoop

out:
	j continue

win:
	li $s3,'X'
	bne $t4,$s3,lose
	
	jal winningSound
	jal youWin
	
	li $v0, 10
	syscall
exit:
	jr $ra
lose:
	jal losingSound
	jal youLose
	
	li $v0,10
	syscall
	j exit

