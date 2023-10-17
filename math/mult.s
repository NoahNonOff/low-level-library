; minus.s
;
; Author: Noah Beaufils 
; Date: Oct-17-2023

global	ll_mult

switch:
	push rdi
	mov rdi, rsi
	pop rsi
	jmp L1

ll_mult:
	xor rax, rax
	cmp rdi, rsi
	jae switch
L1:
	cmp rdi, 0x0
	je return
	add rax, rsi
	sub rdi, 1
	jmp L1
return:
	ret
