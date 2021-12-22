# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: asuikkan <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/07 14:39:59 by asuikkan          #+#    #+#              #
#    Updated: 2021/12/07 14:45:23 by asuikkan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = test_gnl

SRCS = get_next_line.c

OBJ = get_next_line.o

TESTS = ./eval_tests/

TEST_SRCS = $(TESTS)single_long_line.c $(TESTS)closing_newline.c $(TESTS)large_file.c \
$(TESTS)single_line_diff.c $(TESTS)return_values.c $(TESTS)multiple_fd.c

TEST_OBJ = single_long_line.o closing_newline.o large_file.o single_line_diff.o return_values.o \
multiple_fd.o

all: $(NAME)

$(NAME):
	gcc -Wall -Wextra -Werror -I ./libft/includes -I ./ -o get_next_line.o -c get_next_line.c
	gcc -Wall -Wextra -Werror -I ./ -c $(TEST_SRCS)
	gcc -Wall -Wextra -Werror -I ./eval_tests -o main.o -c $(TESTS)main.c
	gcc -g -o $(NAME) main.o $(OBJ) $(TEST_OBJ) -L ./libft/ -lft

clean:
	rm -rf $(OBJ) $(TEST_OBJ) main.o

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re
