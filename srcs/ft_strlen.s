; ft_strlen.asm
;
; Author Noah Beaufils
; Date: 31-May-2022

	%define	NULL 0x00

global ft_strlen

section .text:

ft_strlen:									; arg is set in rdi
			xor	rax, rax					; set rax to 0
			cmp	rdi, NULL					; check if rdi is NULL
			jz	exit						; if yes, go to exit
			jmp	check_rdi					; go to loop
next:
			INC	rdi							; increment the pointer to the string
			INC	rax							; increment rax
check_rdi:
			cmp	byte [rdi], 0x0				; compare rax and '\0'
			jne	next						; if line above isn't true go to Next
exit:
			ret								; return rax (lenght of the string)
