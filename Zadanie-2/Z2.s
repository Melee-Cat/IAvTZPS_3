SECTION .text
extern putchar
global main
main:
push rbp ; пролог
mov rbp, rsp ; пролог
mov eax, 0 ; номер запроса CPUID
cpuid ; получаем ID процессора
mov [outstr], ebx
mov [outstr+4], edx
mov [outstr+8], ecx 
xor rbp, rbp
mov rcx, 12
print_char:
mov rbx, rcx
mov di, [outstr + rbp]
inc rbp
call putchar wrt ..plt; вызов putchar(eax)
mov rcx,rbx
loop print_char
mov di,`\n`
call putchar wrt ..plt; вызов putchar(eax) для перевода строки
mov eax, 0 ; код завершения
pop rbp ; эпилог
retn ; возврат
;----------------------------------
SECTION .bss
outstr: resb 12 ; vendor string
outstr_len EQU $ - outstr