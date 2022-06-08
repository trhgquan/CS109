%include 'io.inc'

extern _scanf
extern _printf
extern _getch

section .text
    inputMessage: db 'Nhap ky tu: ', 0
    
    outputMessage1: db 'Ky tu viet thuong: %c', 10, 0
    
    formatin: db '%c', 0
    
section .data
    char: times 4 db 0

global CMAIN
CMAIN:
    push ebx
    push ecx
    
    push inputMessage
    call _printf
    add esp, 4
    
    push char
    push formatin
    call _scanf
    add esp, 8
    
    mov ebx, dword[char]
    add ebx, 32
    
    push ebx
    push outputMessage1
    call _printf
    add esp, 8

    call _getch

    pop ecx
    pop ebx
    mov eax, 0
    ret