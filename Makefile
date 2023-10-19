# Makefile
#
# Author: Noah Beaufils
# Date Oct-17-2023

LIBC = libC/
LST = linked_list/
MATH = math/
NASM = nasm
NASM_FLAG = -f elf64
LIB_NAME = libasm.a

SRCS =	${LIBC}ft_strlen.s				\
		${LIBC}ft_strcpy.s				\
		${LIBC}ft_strdup.s				\
		${LIBC}ft_strcmp.s				\
		${LIBC}ft_write.s				\
		${LIBC}ft_read.s				\
		${LIBC}ft_atoi_base.s			\
\
		${MATH}add.s					\
		${MATH}div.s					\
		${MATH}minus.s					\
		${MATH}mult.s					\
		${MATH}abs.s					\
\
		${LST}free_list.s				\
		${LST}ft_list_size.s			\
		${LST}ft_create_elem.s			\
		${LST}ft_list_push_front.s

OBJS = $(SRCS:.s=.o)

%.o : %.s
	$(NASM) $(NASM_FLAG) $< -o $@

all	:	$(LIB_NAME)

$(LIB_NAME)	: $(OBJS)
	ar rcs $(LIB_NAME) $(OBJS)
	ranlib $(LIB_NAME)

test	: re
	gcc test.c -g3 $(LIB_NAME) -o test

clean	:
	rm -f $(OBJS)

fclean	: clean
	rm -f $(LIB_NAME)
	rm -f test

re	: fclean all

.PHONY: all clean fclean re

.SILENT:
