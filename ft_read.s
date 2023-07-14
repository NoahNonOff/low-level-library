; ft_read.s
;
; Author: Noah Beaufils 
; Date Jul-14-2023

global ft_read

ft_read:
	xor rax, rax
	syscall
	cmp rax, 0
	jl error
	ret

error:
	mov rax, -1
	ret
