; create_elem.s
;
; Author: Noah Beaufils
; Date Jul-16-2023

extern malloc
		%define NULL 0x00

global ll_create_elem

; sizeof(t_list) -> 16
; sizeof(void *) -> 8

ll_create_elem:
	push rdi
	mov rdi, 16
	call malloc WRT ..plt
	test rax, rax
	je ret_NULL
	pop rdi
	mov [rax], rdi
	mov QWORD [rax + 8], NULL
	ret

ret_NULL:
	mov rax, NULL
	ret

; TWORD_size 10
; QWORD_size 8
; DWORD_size 4
; WORD_size 2
; BYTE_size 1
