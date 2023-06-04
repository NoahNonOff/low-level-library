; ft_strdup
;
; Author Noah Beaufils
; Date: 4-Jun-2022

	%define NULL 0x0

extern malloc
extern ft_strlen
extern ft_strcpy

global ft_strdup

section .text:

ft_strdup:
			cmp	rdi, NULL		; check if argument is NULL
			jz	exit_error

			call ft_strlen		; call the ft_strlen function
			mov rdi, rax		; put the result of strlen in rdi
			inc	rdi				; increment rdi
			call malloc			; call malloc (result in rax)
			xor	rcx, rcx		; initiate the counter to 0
			cmp rax, NULL		; malloc protection
			jz	exit_error
			mov	rsi, rdi
			mov	rdi, rax
			call ft_strcpy
			ret
exit_error:
			mov	rax, NULL
			ret
