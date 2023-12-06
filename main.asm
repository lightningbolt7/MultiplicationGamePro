 .data
ROW1: .word  1 2 3 4 5 6
ROW2: .word  7 8 9 10 12 14 
ROW3: .word  15 16 18 20 21 24
ROW4: .word  25 27 28 30 32 35
ROW5: .word  36 40 42 45 48 49
ROW6: .word  54 56 63 64 72 81
BroStoresInput: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 # Stores users multiples
newLine: .asciiz "\n"
playerPrompt: .asciiz "\nPlayer 1's turn - "
inputPrompt: .asciiz "\nEnter a number (1-9): "
computerPrompt1: .asciiz "\nComputer's turn - " 
computerPrompt2: .asciiz "\nComputer picked: "


.text
# s0 stores the users input
# s1 contains the random number from the bot
# s2 stores address of array
# s3 stores current product

.globl main
    # Play starting sound
    jal startingSound
    
    # Generates the bots first move
    jal setRandom
    add $s1, $v0, $zero
    li $t9, 0 # Debugging counter for number of terms
    la $a0, ROW1 # Load grid into $a0
    
main:    
    # Print grid
    li $v0, 4
    la $a0, newLine
    syscall
    
    la $a0, ROW1 # Pass grid to print grid
    jal printGrid
    
userInput:
    # Display computer choice prompt
    li $v0, 4
    la $a0, computerPrompt2
    syscall
    
    # Prints computer integer
    addi $a0, $s1, 0
    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newLine
    syscall
    
    # Display user input prompts
    li $v0, 4
    la $a0, playerPrompt
    syscall
    
    # Validate user input
    move $a0, $s1 # Pass bot input to subroutine
    la $a1, BroStoresInput
    jal  userInputValidation # Calls userInputValidation method
    move $s0, $v0 # Moves user input into $s0
    move $s3, $v1 # Moves user product into #s3
    
    # Updates the grid w/ user choice
    move $a0, $s3 # Moves user's product into $a0
    li $a1, 'X' # Loads user marking into $a1
    la $a2, ROW1 # Loads array address into $a2
    jal updateGrid
    #la $s2, 0($v0) # Loads updated grid
    
computerInput:
    # Generate and validate computer input
    move $a0, $s0 # Passes user input to computer validation
    la $a2, BroStoresInput
    jal compInputValidation # Calls compInputValidation method
    move $s1, $v0 # Moves computer input into $s1
    
    add $a0, $s1, $zero
    
    move $s3, $v1 # Moves computer product into $s3
    
    # Updates the grid w/ computer choice
    move $a0, $s3 # Stores computer's product into $a0
    li $a1, 'O' # Store computer marking into $s1
    la $a2, ROW1 # Load array address into $a2
    jal updateGrid
    #la $s2, 0($v0)
    
    la $a0, ROW1 # Pass grid to wincheck
    li $a1,'X'
    jal columnWinCheck # Calls winCheckV module, void type. This program determines if the program ends or not by declaring a winner. Program returns 0 if no one wins
    jal rowWinCheck # Calls rowWinCheck module, void type. This program determines if the program ends or not by declaring a winner. Program returns 0 if no one wins
    jal diagonal1Check # Calls winCheckD module, void type. This program determines if the program ends or not by declaring a winner. Program returns 0 if no one wins
    jal diagonal2Check
    
    la $a0, ROW1 # Pass grid to wincheck
    li $a1,'O'
    jal columnWinCheck # Calls winCheckV module, void type. This program determines if the program ends or not by declaring a winner. Program returns 0 if no one wins
    jal rowWinCheck # Calls rowWinCheck module, void type. This program determines if the program ends or not by declaring a winner. Program returns 0 if no one wins
    jal diagonal1Check # Calls winCheckD module, void type. This program determines if the program ends or not by declaring a winner. Program returns 0 if no one wins
    jal diagonal2Check
    
    addi $t9, $t9, 1
    j main
