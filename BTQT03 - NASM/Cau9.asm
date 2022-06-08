%include"io.inc"

extern _getch
extern _gets
extern _printf

section .data
    inputMessage: db 'Nhap mot xau: ', 0
    outputMessage: db 'Xau dao nguoc: %s', 10, 0
    
section .bss
    string resd 255

section .text
global CMAIN
CMAIN:
    push inputMessage
    call _printf
    add esp, 4
    
    push string
    call _gets
    add esp, 4
    
    push string
    call daoChuoi
    
    push eax
    push outputMessage
    call _printf
    add esp, 8
    
    call _getch
    
    xor eax, eax
    ret

daoChuoi:
        push ebp
        mov ebp, esp
        mov eax, [ebp + 8]
        mov edx, eax
timDoDai:
        mov ch, [edx]
        inc edx
        test ch, ch        
        jnz timDoDai
        sub edx, 2
hoanVi:
        cmp eax, edx       
        jg end
        mov cl, [eax]
        mov ch, [edx]
        mov [edx], cl
        mov [eax], ch
        inc eax
        dec edx
        jmp hoanVi            
end:
        mov eax, [ebp + 8]
        pop ebp
        ret