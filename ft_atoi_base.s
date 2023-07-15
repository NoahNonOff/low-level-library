; ft_atoi_base.s
;
; Author: Noah Beaufils 
; Date Jul-15-2023

		%define NULL 0x00

extern ft_strlen

global in_base

ft_atoi_base:
	xor rax, rax
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
	cmp BYTE [rsi], dil ; if (str[i] == rdi)
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
	cmp BYTE [rdi], 32
	jz ret_zero ; if rdi == space

	cmp BYTE [rdi], 9
	jae complex_cond ; if rdi >= 9

aft_cond1:
	cmp BYTE [rdi], 43
	jz ret_zero ; if rdi == '+'

	cmp BYTE [rdi], 45
	jz ret_zero ; if rdi == '-'

	jmp ret_one ; go to ret_one

complex_cond:
	cmp BYTE [rdi], 13
	jbe ret_zero ; if rdi <= 13
	jmp aft_cond1
