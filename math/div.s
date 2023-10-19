; div.s
;
; Author: Noah Beaufils 
; Date: Oct-19-2023

global	ll_div

extern	__errno_location

ll_div:
	xor rax, rax

	cmp esi, 0
	je div_by_zero

	mov eax, edi
	mov ebx, esi
	xor edx, edx
	div ebx
	ret

div_by_zero:
	call __errno_location WRT ..plt
	mov byte [rax], 1 ; set errno to EPERM
	mov rax, 0
	ret