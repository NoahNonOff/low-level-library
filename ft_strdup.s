; ft_strcmp.s
;
; Author: Noah Beaufils 
; Date Jul-14-2023

		%define NULL 0x00

global	ft_strdup

extern	malloc, ft_strlen, ft_strcpy

ft_strdup:


; arguments:
; rax -> rdi / rsi / rdx / r10 / r8 / r9
; 
; push |a|  pop |b| --> r8 = a
; (a)  |b| (r8) | |
;      | |      | |
