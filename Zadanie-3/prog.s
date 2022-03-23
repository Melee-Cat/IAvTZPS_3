SECTION .text
GLOBAL crc32d
; unsigned int crc32d(const int * buf, unsigned long len)
; * buf - rdi
; len - rsi
crc32d:
mov eax, -1 ; начальное заполнение
mov r11, 0 ; индекс массива
.oncemore:
crc32 eax, dword [rdi + r11*4] ; накопление CRC
inc r11 ; следующий элемент массива
cmp r11, rsi ; конец массива?
jne .oncemore ; нет – еще разок
xor eax, -1 ; инверсия результата
ret