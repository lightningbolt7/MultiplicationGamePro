.data
WIN_PROMPT: .asciiz "You WON !! :D" 
LOSE_PROMPT: .asciiz "You lost to a bot wth!?"
.text

.globl diagonal2Check

diagonal2Check:
	la $t0, 0($a0) # Loads address into $t0
	li $t1,0 #win condition counter
	move $t4,$a1
	li $t9,6 # S1 STORES THE CONSTANT VALUE OF NUMBER OF ELEMENTS IN A ROW
	li $s2,4 #win cindition checker
	li $s3,17 #limits the column
	li $s4,0
	li $s5,3 #limits the row
	li $s6,0 #overall counter of elements to compare with s6

outerLoop:
	li $t1,0
	blt $s4,$s5,skip
	beq  $s6,$s3,exit
	la $s7,0($t0) #copying the array address
	innerLoop:
		lw $s0,0($s7)
		bne $s0,$t4,out
		addi $t1,$t1,1
		beq $t1,$s2,win 
		addi $s7,$s7,20  #to move to the next diagonal element
		j innerLoop
	
	skip:
		addi $t0,$t0,4 # to move through the array
		addi $s4,$s4,1
		addi $s6,$s6,1
		beq $t9,$s4,offset
		j outerLoop

out:
	j skip
offset:
	li $s4,0
	j outerLoop	
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
		
	
