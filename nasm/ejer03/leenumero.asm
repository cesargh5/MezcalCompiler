section .data
	usermsg1 db "ingrese un numero: ", 0xA, 0xD
	len1 equ $ - usermsg1
	usermsg2 db "ingresa el segundo numero: ", 0xA, 0xD
	len2 equ $ - usermsg2
	dispRes db "el resultado de la suma es: ", 0xA, 0xD
	len3 equ $ - dispRes

section .bss
	num1 resb 5
	num2 resb 5
	res resb 5

section .text
	global _start

_start:
	; impresion del usermsg1
	mov eax, 4
	mov ebx, 1
	mov ecx, usermsg1
	mov edx, len1
	int 0x80

	; lectura desde el teclado
	mov eax, 3
	mov ebx, 2
	mov ecx, num1
	mov edx, 5
	int 0x80

	; imprimiendo el usermsg2
	mov eax, 4
	mov ebx, 1
	mov ecx, usermsg2
	mov edx, len2
	int 0x80

	; lectura desde el teclado
        mov eax, 3
        mov ebx, 2
        mov ecx, num2
        mov edx, 5
        int 0x80

	; calculating add ap
	mov eax, [num1]
	mov eax, '0'
	mov ebx, [num2]
	mov ebx, '0'
	add eax, ebx
	add eax, '0'
	mov [res], eax

	; printing result message
	mov eax, 4
	mov ebx, 1
	mov ecx, dispRes
	mov edx, len3
	int 0x80

	; printing add result
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 5
	int 0x80

	;cierre del programa

mov eax, 1
int 0x80
