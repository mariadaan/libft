# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: mdaan <mdaan@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/10/31 11:56:32 by mdaan         #+#    #+#                  #
#    Updated: 2021/03/22 10:42:26 by mdaan         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME	=	libft.a
SRCS	=	$(wildcard ascii/*.c)				\
			$(wildcard mem/*.c)				\
			$(wildcard put/*.c)				\
			$(wildcard str/*.c)				\
			$(wildcard lst/*.c)

SRCS_FILES = $(shell find *  -type f -name '*.c' -exec basename {} \;)

LIBC	=	ar -rcs
RM		=	rm -f
CC		=	gcc
FLAGS	=	-Wall -Werror -Wextra

OBJSDIR	=	objs/
OBJS	=	$(SRCS_FILES:%.c=$(OBJSDIR)%.o)

all:		$(OBJSDIR) $(NAME)

$(OBJSDIR):
			echo $(SRCS)
			mkdir $@
			echo $(OBJS)

$(NAME):	$(OBJS)
			${LIBC} $(NAME) $(OBJS)

$(OBJS):		$(SRCS) libft.h
			$(CC) -c $(FLAGS) $< -o $@

clean:
			${RM} $(OBJS)
			${RM} -d $(OBJSDIR)

fclean:		clean
			${RM} $(NAME)

re:			fclean all

.PHONY:		all clean fclean re
