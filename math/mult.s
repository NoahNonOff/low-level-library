; mult.s
;
; Author: Noah Beaufils 
; Date: Oct-19-2023

global	ll_mult

extern	ll_abs

switch:
	push rdi
	mov edi, esi
	pop rsi
	jmp L1

ll_mult:
	mov r10, 0		; check for the sign
	test edi, edi
	jns Pt1
	mov r10, 1
Pt1:
	test esi, esi
	jns Pt2

	cmp r10, 0x0
	je not_neg
	mov r10, 0
	jmp Pt2

not_neg:
	mov r10, 1		; 1 = '-' | 0 = '+'

Pt2:				; take the absolute value of 'a' and 'b'
	mov eax, edi
	call ll_abs
	mov edi, eax

	mov eax, esi
	call ll_abs
	mov esi, eax

	xor eax, eax	; make the calcul
	cmp edi, esi
	jae switch
L1:
	cmp edi, 0x0
	je return
	add eax, esi
	sub edi, 1
	jmp L1

return:
	cmp r10, 0
	je Pt3
	neg eax
Pt3:
	ret
