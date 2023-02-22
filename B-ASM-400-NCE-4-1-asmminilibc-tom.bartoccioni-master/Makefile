##
## EPITECH PROJECT, 2021
## Makefile
## File description:
## Makefile
##

SRC	=		rindex.asm		\
			strlen.asm		\
			strcmp.asm		\
			strncmp.asm		\
			strchr.asm		\
			strstr.asm		\
			strpbrk.asm		\
			strcspn.asm		\
			strcasecmp.asm	\
			memcpy.asm		\
			memmove.asm		\
			memset.asm		\

ASM			= 	nasm
ASFLAGS		= 	-f elf64

CC			= 	ld
CFLAGS		= 	-fPIC -shared -nostdlib

OBJS		=	$(SRC:.asm=.o)

%.o : %.asm
				$(ASM) $(ASFLAGS) -o $@ $<

NAME		=	libasm.so

all			:	$(NAME)
				rm -f $(OBJS)

$(NAME)		:	$(OBJS)
	 			$(CC) $(CFLAGS) -o $(NAME) $(OBJS)

clean		:
				rm -f $(OBJS)

fclean		:	clean
				rm -f $(NAME)

re			:	fclean all