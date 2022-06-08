.data
  firstMessage:         .asciiz "a = "
  secondMessage:        .asciiz "b = "
  sumMessage:           .asciiz "\na + b = "
  minusMessage:         .asciiz "\na - b = "
  mulMessage:           .asciiz "\na * b = "
  divMessage:           .asciiz "\na / b = "
  divMessage.remainder: .asciiz "\nremainder = "

.text
  li $v0, 4
  la $a0, firstMessage
  syscall
 
  li $v0, 5
  syscall
  move $s0, $v0
  
  li $v0, 4
  la $a0, secondMessage
  syscall

  li $v0, 5
  syscall
  move $s1, $v0

  # Sum
  li $v0, 4
  la $a0, sumMessage
  syscall

  add $t1, $s0, $s1
  
  li $v0, 1
  move $a0, $t1
  syscall

  # Substract
  li $v0, 4
  la $a0, minusMessage
  syscall

  sub $t1, $s0, $s1
  
  li $v0, 1
  move $a0, $t1
  syscall

  # Multiply
  li $v0, 4
  la $a0, mulMessage
  syscall
  
  mult $s0, $s1
  li $v0, 1
  mflo $a0
  syscall
  
  # Division
  div $s0, $s1

  ## Result
  li $v0, 4
  la $a0, divMessage
  syscall 
 	
  li $v0, 1
  mflo $a0
  syscall
 	
  ## Remainder
  li $v0, 4
  la $a0, divMessage.remainder
  syscall
 	
  li $v0, 1
  mfhi $a0
  syscall

  # Exit
  li $v0, 10
  syscall
