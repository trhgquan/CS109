%include'io.inc'

extern _scanf 
extern _printf
extern _getch

SECTION .data
    message1: db 'Nhap so thu nhat: ', 0
    message2: db 'Nhap so thu hai: ', 0

    addMessage: db 'Tong = %d', 10, 0
    subMessage: db 'Hieu = %d', 10, 0
    mulMessage: db 'Tich = %d', 10, 0
    divMessage: db 'Thuong = %d, du = %d', 10, 0

    formatin: db '%d', 0
    integer1: times 4 db 0
    integer2: times 4 db 0
SECTION .text

global CMAIN
CMAIN:
   push ebx
   push ecx
   
   push message1
   call _printf
   add esp, 4
   
   push integer1
   push formatin
   call _scanf
   add esp, 8

   push message2
   call _printf
   add esp, 4
   
   push integer2
   push formatin
   call _scanf
   add esp, 8

   mov ebx, dword [integer1]
   mov ecx, dword [integer2]
   add ebx, ecx
   
   push ebx
   push addMessage
   call _printf
   add esp, 8
   
   mov ebx, dword [integer1]
   mov ecx, dword [integer2]
   sub ebx, ecx
   
   push ebx
   push subMessage
   call _printf
   add esp, 8
   
   mov eax, dword [integer1]
   mov ebx, dword [integer2]
   imul eax, ebx
   
   ; Store result.
   mov cx, dx
   shl ecx, 16
   mov cx, ax

   push ecx
   push mulMessage
   call _printf
   add esp, 8
   
   mov eax, dword[integer1]
   mov ebx, dword[integer2]
   
   idiv ebx
   
   push edx
   push eax
   push divMessage
   call _printf
   add esp, 12
   
   pop ecx
   pop ebx
   mov eax, 0
   
   call _getch
   ret