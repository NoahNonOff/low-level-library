; ft_write.s
;
; Author: Noah Beaufils 
; Date Jul-14-2023

global ft_write

ft_write:
	mov rax, 1
	syscall
	cmp rax, 0
	jl error
	ret

error:
	mov rax, -1
	ret
