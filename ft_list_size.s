; ft_list_size.s
;
; Author: Noah Beaufils
; Date Jul-16-2023

		%define NULL 0x00

global ft_list_size

ft_list_size:
	xor rax, rax ; rax = 0
L1:
	cmp rdi, NULL ; if rdi == NULL
	je ret_
	mov r8, QWORD [rdi + 8]
	mov rdi, r8
	inc rax
	jmp L1

ret_:
	ret
