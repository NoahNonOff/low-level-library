; ft_strcmp.s
;
; Author: Noah Beaufils 
; Date Jul-14-2023

		%define NULL 0x00

global	ft_strdup

extern	malloc, ft_strlen, ft_strcpy

ft_strdup:
	cmp rdi, NULL ; check if str == NULL
	jz exit_error
	call ft_strlen ; rax = ft_strlen
	inc rax ; rax++
	push rdi ; save rdi in stack
	mov rdi, rax
	call malloc WRT ..plt; call malloc
	;"WRT" means "With Respect To ...", i.e, "in the context of ..."

	test rax, rax ; if malloc failed
	jz exit_error

	pop r8
	mov rdi, rax
	mov rsi, r8
	call ft_strcpy
	ret

exit_error:
	mov rax, NULL ; return NULL
	ret


; arguments:
; rax -> rdi / rsi / rdx / r10 / r8 / r9
; 
; push |a|  pop |b| --> r8 = a
; (a)  |b| (r8) | |
;      | |      | |
