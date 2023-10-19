; free_list.s
;
; Author: Noah Beaufils
; Date Jul-16-2023

extern free
		%define NULL 0x00

global ll_free_list

ll_free_list:
	cmp rdi, NULL
	je ret_
	mov r8, QWORD [rdi + 8]
	call free WRT ..plt
	mov rdi, r8
	jmp ll_free_list

ret_:
	ret
