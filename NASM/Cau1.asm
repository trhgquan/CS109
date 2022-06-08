%include "io.inc"

extern _gets
extern _getch
extern _printf

section .data
    inputString db "Nhap mot xau: ", 0
    outputString db "Xau ban vua nhap: ", 0


    inputFormat db "%s", 0
    outputFormat db "%s\n", 0
    
    string db 0
section .text
global CMAIN
CMAIN:
    push inputString
    call _printf
    add esp, 4
    
    push string
    call _gets
    add esp, 4
    
    push outputString
    call _printf
    add esp, 4
    
    push outputFormat
    push string
    call _printf
    add esp, 8

    call _getch
    
    ;write your code here
    xor eax, eax
    ret