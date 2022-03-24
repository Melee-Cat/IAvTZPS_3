SECTION .text
global getCpuName
getCpuName:
push rbp ; пролог
mov rbp, rsp ; пролог
push rbx 
mov rdi, cpustr
mov esi, 0x80000002
get_brand:
mov eax, esi
cpuid
mov [rdi], eax
mov [rdi+4], ebx
mov [rdi+8], ecx
mov [rdi+12], edx
inc esi
add rdi, 16
cmp esi, 0x80000004
jle get_brand
mov eax, cpustr; возврат указателя на строку
pop rbx
pop rbp ; эпилог
retn ; возврат
;----------------------------------
SECTION .bss
cpustr: resb 48 ; CPU name string
cpustr_len EQU $ - cpustr
