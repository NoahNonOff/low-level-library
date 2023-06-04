# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nbeaufil <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/31 16:50:56 by nbeaufil          #+#    #+#              #
#    Updated: 2023/06/04 03:45:54 by nbeaufil         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	tester
MAIN	=	main
OBJDIR	=	object
SRCDIR	=	srcs

CMD1	=	ft_strlen
CMD2	=	ft_strcmp
CMD3	=	ft_strcpy
CMD4	=	ft_strdup

all	:
ifneq (,$(wildcard ./${NAME}))
		echo make: \'${NAME}\' is already up to date.
else
	make ${NAME}
endif

$(OBJDIR)	:
	mkdir ${OBJDIR}

create_objs:
	gcc -c ${MAIN}.c -o ${OBJDIR}/${MAIN}.o
	nasm -felf64 ${SRCDIR}/${CMD1}.s -o ${OBJDIR}/${CMD1}.o
	nasm -felf64 ${SRCDIR}/${CMD2}.s -o ${OBJDIR}/${CMD2}.o
	nasm -felf64 ${SRCDIR}/${CMD3}.s -o ${OBJDIR}/${CMD3}.o
	nasm -felf64 ${SRCDIR}/${CMD4}.s -o ${OBJDIR}/${CMD4}.o

${NAME}	:	${OBJDIR} create_objs
	#ld -m elf_i386 ${OBJDIR}/*.o -o ${NAME}
	gcc ${OBJDIR}/*.o -o ${NAME}

clean	:
ifneq (,$(wildcard ./${OBJDIR}/*.o))
	rm ${OBJDIR}/*.o
endif

fclean	: clean
ifneq (,$(wildcard ./${NAME}))
	rm ${NAME}
endif

re	: fclean ${NAME}

.PHONY: re fclean clean

.SILENT:
