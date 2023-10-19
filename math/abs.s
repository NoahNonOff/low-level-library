; abs.s
;
; Author: Noah Beaufils 
; Date: Oct-19-2023

global ll_abs

ll_abs:
	test eax, eax
	jns no_neg
	neg eax
no_neg:
	ret
