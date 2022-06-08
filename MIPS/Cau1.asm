.data
  inputString: .asciiz "Nhap mot chuoi: "
  outputString: .asciiz "Chuoi vua nhap: "
  
.text
  # In thong bao nhap chuoi ra man hinh
  li $v0, 4
  la $a0, inputString
  syscall
  
  # Nhap chuoi vao tu ban phim
  li $v0, 8
  li $a1, 255
  syscall
  move $s0, $a0
  
  # In thong bao ra man hinh
  li $v0, 4
  la $a0, outputString
  syscall
  
  # In chuoi ra man hinh
  li $v0, 4
  move $a0, $s0
  syscall
  
  # Thoat
  li $v0, 10
  syscall
main:

