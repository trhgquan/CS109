.data
  inputString1: .asciiz "Nhap so a = "
  inputString2: .asciiz"\nNhap so b = "
  outputString: .asciiz"\nSo lon hon la: "

.text
  la $a0, inputString1
  li $v0, 4
  syscall

  li $v0, 5
  syscall
  move $s0, $v0

  la $a0, inputString2
  li $v0, 4
  syscall

  li $v0, 5
  syscall
  move $s1, $v0
  
  move $s2, $zero
  add $s2, $s2, $s0
  sub $s2, $s2, $s1

  bgez $s2, agreater
  j bgreater  

agreater:
  move $s2, $s0
  j final

bgreater:
  move $s2, $s1
  j final

final:
  la $a0, outputString
  li $v0, 4
  syscall

  move $a0, $s2
  li $v0, 1
  syscall
  
  li $v0, 10
  syscall
main:
