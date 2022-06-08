.data
  stringInput: .asciiz "Nhap vao chuoi: "
  stringOutput: .asciiz "Chuoi dao nguoc: "

  input: .space 255
  output: .space 255
.text
  la $a0, stringInput
  li $v0, 4
  syscall

  li $v0, 8
  la $a0, input
  li $a1, 255
  syscall

  li $t0, 0

demKyTu:
  add $t2, $a0, $t0
  lb $t1, 0($t2)

  beq $t1, '\n', chieuDaiXau

  addi $t0, $t0, 1
  j demKyTu

chieuDaiXau:
  sub $t0, $t0, 1
  li $t1, 0
  la $s0, output

daoNguoc:
  add $t2, $a0, $t0
  lb $t3, 0($t2)

  add $t4, $s0, $t1
  sb $t3, 0($t4)
  beq $t0, 0, final

  addi $t1, $t1, 1
  subi $t0, $t0, 1
  j daoNguoc

final:
  la $a0, stringOutput
  li $v0, 4
  syscall

  la $a0, output
  li $v0, 4
  syscall

  li $v0, 10
  syscall
main:
