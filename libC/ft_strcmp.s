; ft_strcmp.s
;
; Author: Noah Beaufils 
; Date Jul-13-2023

		%define NULL 0x00

global ft_strcmp

ft_strcmp:
	cmp rdi, NULL ; check if str1 == NULL
	jz exit_error
	cmp rsi, NULL ; check if str2 == NULL
	jz exit_error

cmp_loop:
	mov al, BYTE [rdi] ; al = *str1
	mov bl, BYTE [rsi] ; bl = *str2
	cmp	al, 0 ; check if str1 == NULL
	je exit
	cmp	bl, 0 ; check if str2 == NULL
	je exit
	cmp al, bl ; compare *str1 and *str2
	jne exit ; if it's not equal
	inc	rdi ; str1++
	inc rsi ; str2++
	jmp cmp_loop

exit:
	movzx rax, al
	movzx r8, bl
	sub rax, r8 ; rax -= r8
	ret

exit_error:
	mov rax, NULL ; return NULL
	ret

; example of (movzx / movsx)
;
; mov al,0x7F
; movzx ebx,al   ; ebx = 0x0000007F
; movsx ebx,al   ; ebx = 0x0000007F
;
; mov al,0x80
; movzx ebx,al   ; ebx = 0x00000080
; movsx ebx,al   ; ebx = 0xFFFFFF80
