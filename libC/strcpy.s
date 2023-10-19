; strcpy.s
;
; Author: Noah Beaufils 
; Date Jul-13-2023

		%define NULL 0x00

global ll_strcpy

ll_strcpy:
	xor rax, rax ; rax = 0
	cmp rsi, NULL ; if str == NULL
	jz exit_error
	jmp copy_loop

copy_loop:
	cmp BYTE [rsi + rax], 0 ; cmp str[i] and 0
	je exit ; if !str[i]
	mov cl, [rsi + rax] ; cl = str[i] (rsi[rax])
	mov [rdi + rax], cl ; (rdi[rax]) ret[i] = cl
	inc	rax ; i++
	jmp copy_loop ; restart the loop

exit:
	mov cl, 0	; cl = 0
	mov [rdi + rax], cl ; null character
	mov rax, rdi ; rax (must contain the return value)
	ret

exit_error:
	mov rax, NULL ; return NULL
	ret
