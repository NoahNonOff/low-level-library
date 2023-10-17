; abs.s
;
; Author: Noah Beaufils 
; Date: Oct-17-2023

global ll_abs

negatif:
	neg rax
	jmp return

ll_abs:
	mov rax, rdi
	add rdi, 1
	cmp rdi, rax
	jbe negatif
return:
	ret
