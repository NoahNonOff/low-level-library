; ft_strcpy.s
;
; Author Noah Beaufils 
; Date: 4-Jun-2022

	%define NULL 0x0

global ft_strcpy

section .text:

ft_strcpy:
			xor	rdx, rdx
			cmp	rdi, NULL				; check if null
			jz	exit_null
			cmp	rsi, NULL				; check if null
			jz	exit_null
loop:
			mov	al, [rsi + rdx]			; put src[i] in al
			mov	byte [rdi + rdx], al	; put al in dest[i]

			cmp	byte [rsi + rdx], 0x0	; check if src[i] == 0 
			jz	end

			inc	rdx						; increment rdx
			jmp	loop					; go to loop
end:
			mov	rax, rdi				; return the dest
			ret
exit_null:
			mov	rax, NULL				; return NULL
			ret
