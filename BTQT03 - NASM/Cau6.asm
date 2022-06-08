%include "io.inc"

extern _scanf
extern _printf
extern _getch

section .text
    inputMessage: db 'Nhap mot ky tu: ', 0
    
    inputFormat: db '%c', 0
    
    isUppercase: db '%c la ky tu in hoa', 10, 0
    isLowercase: db '%c la ky tu in thuong', 10, 0
    isNumeric:   db '%c la so', 10, 0
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
    push inputFormat
    call _scanf
    add esp, 4
    
    mov ebx, dword [char]
    
    cmp ebx, '9'
    jbe number
    
    cmp ebx, 'Z'
    jbe uppercase
    
    jmp lowercase

number:
    mov eax, isNumeric
    jmp end

uppercase:
    mov eax, isUppercase
    jmp end
    
lowercase:
    mov eax, isLowercase
    jmp end

end:
    push ebx
    push eax
    call _printf
    add esp, 8
    
    call _getch

    ;write your code here
    mov eax, 0
    pop ecx
    pop ebx
    ret