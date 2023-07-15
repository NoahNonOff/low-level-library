# Makefile
#
# Author: Noah Beaufils 
# Date Jul-13-2023

SRCS		=	ft_strlen.s		\
				ft_strcpy.s		\
				ft_strdup.s		\
				ft_read.s		\
				ft_write.s		\
				ft_strcmp.s		\
				ft_atoi_base.s

NASM		=	nasm
NASM_FLAG	=	-f elf64 -g
LIB_NAME	=	libasm.a

OBJS		=	$(SRCS:.s=.o)

%.o : %.s
	$(NASM) $(NASM_FLAG) $< -o $@

all	:	$(LIB_NAME)

$(LIB_NAME)	: $(OBJS)
	ar rcs $(LIB_NAME) $(OBJS)
	ranlib $(LIB_NAME)

test	: re
	gcc -g test.c $(LIB_NAME) -o test

clean	:
	rm -f $(OBJS)

fclean	: clean
	rm -f $(LIB_NAME)
	rm -f test

re	: fclean all

.PHONY: all clean fclean re

.SILENT:
