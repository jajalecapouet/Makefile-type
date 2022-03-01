# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: njaros <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/01 15:17:57 by njaros            #+#    #+#              #
#    Updated: 2022/03/01 16:14:59 by njaros           ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

## LES INCONTOURNABLES ##

NAME = fdf
CC = gcc
FLAGS = -Werror -Wextra -Wall -D BUFFER_SIZE=30

## LES CHEMINS ##

PATH_SRCS = src
PATH_OBJS = obj
PATH_INCLUDES = includes

## LES CHEMINS DES LIBRAIRIES ##

LIB =	libft/libft.a \
		minilibx/minilibx_macos/libmlx.a

## LES SOURCES, OBJETS et INCLUDES ##

LST_SRCS =	fdf_utils1.c \
			fdf_utils2.c \
			fdf_utils3.c \
			fdf.c \
			get_next_line_utils.c \
			get_next_line.c \
			i_m_free.c \
			main.c \
			parsing_fill_utils.c \
			parsing_fill_utils2.c \
			parsing_fill.c
LST_OBJS = ${LST_SRCS:.c=.o}
LST_INCLUDES =	fdf.h \
				get_next_line.h \
				libft.h \
				mlx.h
SRC = $(addprefix ${PATH_SRCS}/,${LST_SRCS})
OBJS = $(addprefix ${PATH_OBJS}/,${LST_OBJS})
INCLUDES = $(addprefix ${PATH_INCLUDES}/,${LST_INCLUDES})

## LES REGLES DE COMPILATION DU PROGRAMME ##

all :				lib_mlx lib_libft ${LIB} ${NAME}

${NAME} :			${OBJS}
					${CC} ${FLAGS} ${OBJS} ${LIB} -framework OpenGL -framework AppKit -o $@

${PATH_OBJS}/%.o:	${PATH_SRCS}/%.c ${INCLUDES} ${LIB} Makefile | ${PATH_OBJS}
					${CC} ${FLAGS} -c $< -o $@ -I ${PATH_INCLUDES}

${PATH_OBJS}:
					mkdir obj

## LES REGLES DE COMPILATION DES LIBRAIRIES ##

${LIB}:				lib_mlx lib_libft

lib_libft:
					make -C ./libft

lib_mlx:
					make -C ./minilibx/minilibx_macos

## LES REGLES DE SUPPRESSION ET RE ##

clean:
					make clean -C ./libft
					rm -rf obj

fclean:				clean
					make fclean -C ./libft
					make clean -C ./minilibx/minilibx_macos
					rm fdf

re:					fclean all

## LE TRUC ##

.PHONY: all re clean fclean

## FIN ##