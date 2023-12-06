.data   #:3

    pitch: .byte 61 # $a0 = pitch (0-127)
    duration: .byte 400 # $a1 = duration in milliseconds
    instrument: .byte 0 #$ a2 = instrument (0-127)
    volume: .byte 127 # $a3 = volume (0-127)

.text
.globl startingSound
startingSound:
    lb $t0, pitch
    lb $t1, duration 
    lb $t2, instrument
    lb $t3, volume 
    
    move $a0, $t0 
    move $a1, $t1 
    move $a2, $t2
    move $a3, $t3
    
    addi $a0, $zero, 70
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 127
    li $v0, 31
    syscall
    
    addi $a0, $zero, 73
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 127
    li $v0, 31
    syscall
    
    addi $a0, $zero, 76
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 127
    li $v0, 31
    syscall
    
    addi $a0, $zero, 79
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 127
    li $v0, 31
    syscall
    
    addi $a0, $zero, 82
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 127
    li $v0, 31
    syscall
    
    addi $a0, $zero, 85
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 127
    li $v0, 31
    syscall
    
    addi $a0, $zero, 85
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 0
    li $v0, 31
    syscall
    
    addi $a0, $zero, 85
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 0
    li $v0, 31
    syscall
    
    addi $a0, $zero, 85
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 0
    li $v0, 31
    syscall
    
    addi $a0, $zero, 85
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 0
    li $v0, 31
    syscall
    
    addi $a0, $zero, 85
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 0
    li $v0, 31
    syscall
    
    addi $a0, $zero, 90
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 127
    li $v0, 31
    syscall
    
    addi $a0, $zero, 85
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 0
    li $v0, 31
    syscall
    
    addi $a0, $zero, 85
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 0
    li $v0, 31
    syscall
    
    addi $a0, $zero, 85
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 0
    li $v0, 31
    syscall
    
    addi $a0, $zero, 90
    addi $a1, $zero, 2000
    addi $a2, $zero, 0
    addi $a3, $zero, 127
    li $v0, 31
    syscall

    # End the program
    jr $ra
