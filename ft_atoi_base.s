; ft_atoi_base.s
;
; Author: Noah Beaufils 
; Date Jul-16-2023

		%define NULL 0x00

extern ft_strlen

global ft_atoi_base

ft_atoi_base:
	xor rax, rax ; rbx = 0
	xor r8, r8 ; rbx = 0
	xor rbx, rbx ; rbx = 0

	cmp rdi, NULL ; check if rdi == NULL
	jz ret_zero
	cmp rsi, NULL ; check if rsi == NULL
	jz ret_zero

	push rdi ; save rdi
	push rsi ; save rsi
	mov rdi, rsi
	call verif_base ; check the base
	pop rsi
	pop rdi
	cmp rax, 0 ; if there is a problem with the base
	jz ret_zero

L1:
	cmp BYTE [rdi], 0 ; if (str[i])
	je ret_zero
	push rdi ; save rdi
	call is_white_space ; in loop while is_white_space
	pop rdi
	cmp rax, 1
	je L2
	inc rdi
	jmp L1

L2_inc1: ; loop to pass througth + and - and get the sign
	inc rbx	
L2_inc2:
	inc rdi	
L2:
	cmp BYTE [rdi], 0 ; if (str[i])
	je ret_zero
	cmp BYTE [rdi], 43 ; '+'
	je L2_inc2
	cmp BYTE [rdi], 45 ; '-'
	jne L3
	cmp rbx, 1
	jne L2_inc1
	mov rbx, 0
	jmp L2_inc2

L3_inc:
	inc rdi
L3: ; loop to calculate the number
	cmp BYTE [rdi], 0 ; if (str[i])
	je L4

	push rdi
	push rsi
	call in_base ; check if i is in base 
	pop rsi      ; and return it index
	pop rdi
	cmp rax, -1
	je L5

	push rax ; begin of mult
	mov rax, r8
	mul r9
	mov r8, rax
	pop rax
	add r8, rax ; end of mult

	jmp L3_inc
L4:
	mov rax, r8 ; if necessary, set the number to negative
	cmp rbx, 1
	jne L5
	neg rax
L5:
	ret

; ============================================ ;

in_base:
	xor rax, rax ; rax = 0 (i = 0)
	jmp in_base_loop
base_loop:
	inc rax ; rax++ (i++)
	inc rsi ; *str++
in_base_loop:
	cmp BYTE [rsi], 0 ; if (str[i])
	je ret_error
	mov r10b, BYTE [rdi]
	cmp BYTE [rsi], r10b ; if (str[i] == rdi)
	jz ret_
	jmp base_loop

ret_error:
	mov rax, -1 ; return -1
ret_:
	ret

; ============================================ ;

verif_base:
	call ft_strlen
	cmp rax, 2 ; check if base's length is bigger than 1
	jb ret_zero
	mov r9, rax ; save result of ft_strlen in r9

verif_loop1:
	cmp BYTE [rdi + 1], NULL
	je ret_one
	mov rsi, rdi
	inc rsi

verif_loop2:
	cmp BYTE [rsi], NULL
	je end_loop2
	call check_base_arg ; check str[i] && str[i + 1]
	cmp rax, 0
	je ret_zero
	inc rsi
	jmp verif_loop2
end_loop2:

	inc rdi
	jmp verif_loop1
ret_one:
	mov rax, 1 ; return one
	ret

ret_zero:
	mov rax, 0 ; return zero
	ret

; ============================================ ;

check_base_arg:
	mov cl, [rsi] ; check if both args are equal
	cmp [rdi], cl
	je ret_zero
	call is_good_char ; check the first arg
	cmp rax, 0
	je ret_zero

	inc rdi
	call is_good_char ; check second arg
	dec rdi
	cmp rax, 0
	je ret_zero

	jmp ret_one

; ============================================ ;

is_good_char:
	cmp BYTE [rdi], 43
	jz ret_zero ; if rdi == '+'

	cmp BYTE [rdi], 45
	jz ret_zero ; if rdi == '-'

is_white_space:
	cmp BYTE [rdi], 32
	jz ret_zero ; if rdi == space

	cmp BYTE [rdi], 9
	jae complex_cond ; if rdi >= 9
	jmp ret_one

complex_cond:
	cmp BYTE [rdi], 13
	jbe ret_zero ; if rdi <= 13
	jmp ret_one
