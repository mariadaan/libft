# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: mdaan <mdaan@student.codam.nl>               +#+                      #
#                                                    +#+                       #
#    Created: 2020/10/31 11:56:32 by mdaan         #+#    #+#                  #
#    Updated: 2021/03/12 16:19:02 by mdaan         ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME	=	libft.a
SRCS	=	$(wildcard ./ascii/*.c)				\
			$(wildcard ./mem/*.c)				\
			$(wildcard ./put/*.c)				\
			$(wildcard ./str/*.c)

SRCS_B	=	$(wildcard ./lst/*.c)

OBJS	=	$(SRCS:.c=.o)
OBJS_B	=	$(SRCS_B:.c=.o)
OBJS_D	=	objs
LIBC	=	ar -rcs
RM		=	rm -f
CC		=	gcc
FLAGS	=	-Wall -Werror -Wextra

ifdef WITH_BONUS
RELEVANT_OBJS = $(OBJS) $(OBJS_B)
else
RELEVANT_OBJS = $(OBJS)
endif

all:		$(OBJS_D) $(NAME)

$(OBJS_D):
			mkdir $(OBJS_D)

$(NAME):	$(RELEVANT_OBJS)
			${LIBC} $(NAME) $(RELEVANT_OBJS)

$(OBJS_D)/%.o:		%.c
			$(CC) -c $(FLAGS) $< -o $@

bonus:
			$(MAKE) WITH_BONUS=1 all

clean:
			${RM} $(OBJS) $(OBJS_B)

fclean:		clean
			${RM} $(NAME)

re:			fclean all

.PHONY:		all bonus clean fclean re %.o
