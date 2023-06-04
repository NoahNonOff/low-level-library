; ft_strcmp.s
;
; Author Noah Beaufils
; Date: 3-Jun-2022

	%define NULL 0x00

global ft_strcmp

section .text:

ft_strcmp:								; args are in rdi (1) and rsi (2)
			cmp	rdi, NULL				; check if rdi is NULL
			jz	exit					; if yes, exit
			cmp	rsi, NULL				; check if rsi is NULL
			jz	exit					; if yes, exit
loop:
			mov	al, byte [rdi]			; al = s1[i]
			mov	bl, byte [rsi]			; al = s2[i]
			cmp	al, 0x0					; check if s1[i] == 0
			je	out						; if yes go to out
			cmp	bl, 0x0					; check if s2[i] == 0
			je	out						; if yes go to out
			cmp	al, bl					; comp al and bl
			jne	out						; if equal 0 go to out

			inc	rdi						; *s1++
			inc	rsi						; *s2++
			jmp	loop					; go to loop
out:
			movzx	rax, al				; upgrade al (lower) in rax (bigger)
			movzx	r8, bl				; put bl (lower) to r8 (bigger)
			sub	rax, r8					; substract rax and r8
exit:
			ret							; return rax
