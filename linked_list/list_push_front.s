; list_push_front.s
;
; Author: Noah Beaufils
; Date Jul-16-2023

extern ft_create_elem
		%define NULL 0x00

global ll_list_push_front

; rdi -> **list
; rsi -> data

ll_list_push_front:
	cmp rdi, NULL ; if rdi == NULL
	je ret_

	push rdi
	mov rdi, rsi
	call ft_create_elem ; create new_node
	pop rdi
	test rax, rax ; if allocation failed
	je ret_

	mov rsi, [rdi] ; rsi become *list
L1:
	mov QWORD [rax + 8], rsi ; new_node->next = *list
	mov QWORD [rdi], rax ; *list == new_node
ret_:
	ret
