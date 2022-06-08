.data
  nhapNString: .asciiz "Nhap n: "
  xuatNString: .asciiz "Tong tu 1 den n la: "

  n: .word 0
  result: .word 0
.text
  la $a0, nhapNString
  li $v0, 4
  syscall

  li $v0, 5
  syscall

  sw $v0, n
  lw $a0, n

  jal tinhTong

  sw $v0, result

  la $a0, xuatNString
  li $v0, 4
  syscall

  lw $a0, result
  li $v0, 1
  syscall

  li $v0, 10
  syscall

tinhTong:
  subi $sp, $sp, 32
  sw $ra, ($sp)
  sw $s0, 4($sp)
  sw $t0, 8($sp)
  sw $t1, 12($sp)

  li $s0, 0
  li $t0, 1

tinhTongTungPhan:
  add $s0, $s0, $t0
  addi $t0, $t0, 1
  slt $t1, $a0, $t0
  beq $t1, 0, tinhTongTungPhan

  move $v0, $s0

  lw $ra, ($sp)
  lw $s0, 4($sp)
  lw $t0, 8($sp)
  lw $t1, 12($sp)

  addi $sp, $sp, 32

  jr $ra

main:
