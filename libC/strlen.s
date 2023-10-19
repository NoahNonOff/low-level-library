; strlen.s
;
; Author: Noah Beaufils 
; Date Jul-13-2023

		%define	NULL 0x00

global	ll_strlen

ll_strlen:
	xor rax, rax ; rax == 0
	cmp rdi, NULL ; if (str == NULL)
	jz exit
	jmp	loop ; go to loop

loop:
	cmp	byte [rdi + rax], 0x0 ; compare str[i] to 0
	je exit ; if (str[i] == 0)
	inc rax ; i++
	jmp loop ; restart the loop

exit:
	ret ; return rax
