%include"io.inc"

extern _printf
extern _scanf
extern _getch

section .data
    stringNhapN db "Nhap n: ", 0
    stringNhapA db "Nhap a[%d]: ", 0
    stringXuatMang db "Mang vua nhap: ", 0
    
    formatInput db "%d", 0
    formatOutput db "%d ", 0
   
section .bss
    n resd 1
    array resd 100
    
section .text
    global CMAIN

CMAIN:
    push stringNhapN
    call _printf
    add esp, 4
    
    push n
    push formatInput
    call _scanf
    add esp, 8
    
    mov ebx, array
    mov esi, 0
    
input:
    push esi
    push stringNhapA
    call _printf
    add esp, 8
    
    push ebx
    push formatInput
    call _scanf
    add esp, 8
    
    add ebx, 4
    inc esi
    
    cmp esi, dword[n]
    jl input
    
    push stringXuatMang
    call _printf
    add esp, 4
    
    mov ebx, array
    mov esi, 0
    
xuatMang:
    push dword[ebx]
    push formatOutput
    call _printf
    add esp, 8
    
    add ebx, 4
    inc esi
    
    cmp esi, dword[n]
    jl xuatMang
    
    call _getch

    xor eax, eax
    ret