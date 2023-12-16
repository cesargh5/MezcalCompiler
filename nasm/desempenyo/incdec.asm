section .data
        usermsg db "ingrese un numero: ", 0xA, 0xD
        len1 equ $ - usermsg
        dispRes1 db "su incremento es: ", 0xA, 0xD
        len2 equ $ - dispRes1
        dispRes2 db "su decremento es: ", 0xA, 0xD
        len3 equ $ - dispRes2

section .bss
        num resb 5
        resinc resb 5
        resdec resb 5

section .text
        global _start

_start:
        ; impresion del usermsg
        mov eax, 4
        mov ebx, 1
        mov ecx, usermsg
        mov edx, len1
        int 0x80

        ; lectura desde el teclado
        mov eax, 3
        mov ebx, 2
        mov ecx, num
        mov edx, 5
        int 0x80

	; incremento
	mov eax, [num]
	inc eax
	mov [resinc], eax

        ; imprimiendo comentario del incremento
        mov eax, 4
        mov ebx, 1
        mov ecx, dispRes1
        mov edx, len2
        int 0x80

	; imprimiendo incremento
	mov eax, 4
	mov ebx, 1
	mov ecx, resinc
	mov edx, 5
	int 0x80

	; decremento
	mov eax, [resinc]
	dec eax
	mov [resdec], eax

	;imprimiendo comentario de decremento
	mov eax, 4
	mov ebx, 1
	mov ecx, dispRes2
	mov edx, len3
	int 0x80

	; imprimiendo decremento
	mov eax, 4
	mov ebx, 1
	mov ecx, resdec
	mov edx, 5
	int 0x80

	; cerrar programa
	mov eax, 1
	int 0x80
