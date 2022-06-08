%include "io.inc"

extern _scanf
extern _printf
extern _getch

section .data
    inputMessage: db 'Nhap n = ', 0
    outputMessage: db 'Tong tu 1 den %d = %d', 10, 0
    
    inputFormat: db '%d', 0
    
section .bss
    result resd 1
    n      resd 1
    
section .text

global CMAIN
CMAIN:    
    ;write your code here
    push inputMessage
    call _printf
    add esp, 4
    
    push n
    push inputFormat
    call _scanf
    add esp, 8
    
    mov eax, 0
    mov esi, 1
    
Loop:
    add eax, esi
    inc esi
    
    cmp esi, dword[n]
    
    jle Loop
    
    mov dword[result], eax
    
    push dword[result]
    push dword[n]
    push outputMessage
    call _printf
    add esp, 12
    
    
    call _getch
    
    xor eax, eax
    ret