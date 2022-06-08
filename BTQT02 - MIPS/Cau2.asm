.data
  inputString: .asciiz "Nhap mot ky tu: "
  outputString1: .asciiz "Ky tu lien truoc: "
  outputString2: .asciiz "Ky tu lien sau: "
	endline: .asciiz "\n"  
.text
  # Xuat thong bao
  la $a0, inputString
  li $v0, 4
  syscall
  
  # Doc ky tu
  li $v0, 12
  syscall
  
  addiu $t1, $v0, 1
  addiu $t2, $v0, -1
  
  la $a0, endline
  li $v0, 4
  syscall
  
  la $a0, outputString2
  li $v0, 4
  syscall
  
  move $a0, $t1
  li $v0, 11
  syscall
  
  la $a0, endline
  li $v0, 4
  syscall
  
  la $a0, outputString1
  li $v0, 4
  syscall
  
  move $a0, $t2
  li $v0, 11
  syscall
  
  la $a0, endline
  li $v0, 4
  syscall
  
  # Thoat
  li $v0, 10
  syscall

main:
