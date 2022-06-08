.data
  nhapNString: .asciiz "Nhap n: "
  nhapAString: .asciiz "Nhap phan tu: "
  outArrayString: .asciiz "Mang vua nhap la: "

  n: .word 255
  arr: .space 255

.text
  la $a0, n
  la $a1, arr

  jal nhapMang
 
  la $a0, outArrayString
  li $v0, 4
  syscall

  lw $a0, n
  la $a1, arr
  jal xuatMang

  li $v0, 10
  syscall

nhapMang:
  subi $sp, $sp, 32
  sw $ra, ($sp)
  sw $s0, 4($sp)
  sw $s1, 8($sp)
  sw $t0, 12($sp)
  sw $t1, 16($sp)

  move $s0, $a0
  move $s1, $a1

  la $a0, nhapNString
  li $v0, 4
  syscall

  li $v0, 5
  syscall

  sw $v0, ($s0)
  lw $s0, ($s0)

  li $t0, 0

nhapPhanTu:
  la $a0, nhapAString
  li $v0, 4
  syscall

  li $v0, 5
  syscall

  sw $v0, ($s1)
  addi $s1, $s1, 4
  addi $t0, $t0, 1
  
  blt $t0, $s0, nhapPhanTu
  
  lw $ra, ($sp)
  lw $s0, 4($sp)
  lw $s1, 8($sp)
  lw $t0, 12($sp)
  lw $t1, 16($sp)

  addi $sp, $sp, 32
  jr $ra

xuatMang:
  subi $sp, $sp, 32
  sw $ra, ($sp)
  sw $s0, 4($sp)
  sw $s1, 8($sp)
  sw $t0, 12($sp)
  sw $t1, 16($sp)

  move $s0, $a0
  move $s1, $a1

  li $t0, 0
xuatPhanTu:
  li $v0, 1
  lw $a0, ($s1)
  syscall

  li $a0, ' ' 
  li $v0, 11
  syscall

  addi $s1, $s1, 4
  addi $t0, $t0, 1

  blt $t0, $s0, xuatPhanTu
  
main: