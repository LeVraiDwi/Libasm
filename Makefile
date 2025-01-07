SRCS = $(addprefix $(SRC_PATH)/,$(SRC_NAME))

SRC_PATH = ./src

SRC_NAME =	ft_strcmp.s ft_strcpy.s ft_strdup.s \
			ft_strlen.s ft_write.s ft_read.s \

OBJS = ${SRCS:.s=.o}

NAME = libasm.a

HEADER = -I "./include"

CASM = nasm

ASMFLAG = -f elf64

ASMFLAGDEBUG = -F dwarf

RM = rm -f

.s.o: 
			${CASM} ${ASMFLAG} $< -o $@

${NAME}:	${OBJS}
			ar rc ${NAME} ${OBJS}

all:		${NAME}

test:		${NAME}
			gcc main.c -L. -lasm -I ./include/

bonus:		${OBJS}
			ar rc ${NAME} ${OBJS}

clean:
			${RM} ${OBJS}

fclean:		clean
			${RM} ${NAME}

re:			fclean all

.PHONY =	all clean fclean re