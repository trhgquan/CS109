%include "io.inc"

extern _scanf
extern _printf
extern _getch

section .text
    inputMessage1: db 'Nhap so a: ', 0
    inputMessage2: db 'Nhap so b: ', 0
    inputFormat: db '%d', 0
    
    outputMessage: db 'So lon hon la: %d', 10, 0
    

section .data
    number1: times 4 db 0
    number2: times 4 db 0

global CMAIN
CMAIN:
    ;write your code here
    push ebx
    push ecx

    push inputMessage1
    call _printf
    add esp, 4
    
    push number1
    push inputFormat
    call _scanf
    add esp, 8
    
    push inputMessage2
    call _printf
    add esp, 4
    
    push number2
    push inputFormat
    call _scanf
    add esp, 8
    
    mov eax, dword[number1]
    mov ebx, dword[number2]
    
    cmp ebx, eax
    jbe first_greater
    jmp else
    
first_greater:
    mov ebx, dword [number1]
    jmp end

else:
    mov ebx, dword [number2]
    jmp end

end:
    push ebx
    push outputMessage
    call _printf
    add esp, 8

    call _getch
    
    pop ecx
    pop ebx
    mov eax, 0
    ret