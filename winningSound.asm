.data   #:3
	notes: .space 32 # Stores 8
	duration: .byte 400 # $a1 = duration in milliseconds
	instrument: .byte 11 #$ a2 = instrument (0-127)
	volume: .space 32 # Stores 8

.text

.globl winningSound
winningSound:
	# Notes Array
	# Index = $t8
	addi $t8, $zero, 0
	
	# Load desired notes
	li $t0, 65 	# F1
	sb $t0, notes($t8)
	addi $t8, $t8, 4
	li $t0, 69 	# A1
	sb $t0, notes($t8)
	addi $t8, $t8, 4
	li $t0, 72 	# C1
	sb $t0, notes($t8)
	addi $t8, $t8, 4
	li $t0, 77 	# C2
	sb $t0, notes($t8)
	addi $t8, $t8, 4
	li $t0, 61 	# Rest
	sb $t0, notes($t8)
	addi $t8, $t8, 4
	li $t0, 72 	# C1
	sb $t0, notes($t8)
	addi $t8, $t8, 4
	li $t0, 77 	# C2
	sb $t0, notes($t8)
	addi $t8, $t8, 4
	li $t0, 61 	# Rest
	sb $t0, notes($t8)
		
	# Volume Array
	addi $t8, $zero, 0
	li $t0, 100
	sb $t0, volume($t8)
	addi $t8, $t8, 4
	sb $t0, volume($t8)
	addi $t8, $t8, 4
	sb $t0, volume($t8)
	addi $t8, $t8, 4
	sb $t0, volume($t8)
	addi $t8, $t8, 4
	li $t0, 0 	# Rest
	sb $t0, volume($t8)
	addi $t8, $t8, 4
	li $t0, 100
	sb $t0, volume($t8)
	addi $t8, $t8, 4
	sb $t0, volume($t8)
	addi $t8, $t8, 4
	li $t0, 0 	# Rest
	sb $t0, volume($t8)
	
	li $t5, 0

loop:
	bgt $t5, 32, return
	li $v0, 31
	lb $t0, notes($t5)
	lb $t1, duration 
	lb $t2, instrument
	lb $t3, volume($t5) 
	move $a0, $t0 
	move $a1, $t1 
	move $a2, $t2
	move $a3, $t3
	syscall
	addi $t5, $t5, 4
	j loop

return:
	jr $ra

