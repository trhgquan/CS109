.data
  inputString: .asciiz "Nhap vao mot ky tu: "
  charIsNumber: .asciiz " la so"
  charIsUppercase: .asciiz " la chu in hoa"
  charIsLowercase: .asciiz " la chu viet thuong"
  endline: .asciiz "\n"
.text
  la $a0, inputString
  li $v0, 4
  syscall

  li $v0, 12
  syscall

  move $s0, $v0

  add $s2, $zero, $s0
  add $s3, $zero, $s0
  sub $s2, $s2, 'Z'
  sub $s3, $s3, '9'

  blez $s3, laSo
  blez $s2, inHoa
  j vietThuong

inHoa:
  la $s1, charIsUppercase
  j final

vietThuong:
  la $s1, charIsLowercase
  j final

laSo:
  la $s1, charIsNumber
  j final

final:
  la $a0, endline
  li $v0, 4
  syscall
 
  move $a0, $s0
  li $v0, 11
  syscall

  move $a0, $s1
  li $v0, 4
  syscall

  li $v0, 10
  syscall

main: