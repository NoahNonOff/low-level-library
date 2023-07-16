; free_list.s
;
; Author: Noah Beaufils
; Date Jul-16-2023

extern free
		%define NULL 0x00

global free_list

free_list:
	cmp rdi, NULL
	je ret_
	mov r8, QWORD [rdi + 8]
	call free WRT ..plt
	mov rdi, r8
	jmp free_list

ret_:
	ret
