# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mrudloff <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/02 15:36:49 by mrudloff          #+#    #+#              #
#    Updated: 2023/01/31 12:49:38 by mrudloff         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
# 								NAME PROJECT								   #
# **************************************************************************** #
NAME	=	libft.a

# **************************************************************************** #
# 								  COMMANDS									   #
# **************************************************************************** #
CC		=	@clang
CFLAGS	=	-Wall -Wextra -Werror
IFLAGS	=	-Iinc
MK		=	@mkdir -p
RM		=	@rm -rf
FILE	=	$(shell ls -lR src/ | grep -F .c | wc -l)
CMP		=	1
CLEAR	=	@clear

# **************************************************************************** #
# 								   COLORS									   #
# **************************************************************************** #
GREEN	=	\033[38;5;76m
RED		=	\033[38;5;160m
YELLOW	=	\033[38;5;226m
ORANGE	=	\033[38;5;202m
PURPLE	=	\033[38;5;213m
LBLUE	=	\033[38;5;51m
BLUE	=	\033[38;5;117m
INDI	=	\033[38;5;99m
RESET	=	\033[00m

# **************************************************************************** #
# 								   PRINTS									   #
# **************************************************************************** #
RNBW	=	@printf "                                                                     \r$(RED)Lib$(ORANGE)ft$(YELLOW) is$(GREEN) re$(LBLUE)ady $(INDI)to $(PURPLE)use$(RESET)\n"

# **************************************************************************** #
# 								   SOURCES									   #
# **************************************************************************** #
# CHECK
CHECK_DIR	:=	check
SRC_CHECK	:=	ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c ft_isspace.c
CHECK		:=	$(SRC_CHECK:%=$(CHECK_DIR)/%)

#LIST
LIST_DIR	:=	list
SRC_LIST	:=	ft_lstadd_back.c ft_lstadd_front.c ft_lstclear.c ft_lstdelone.c ft_lstiter.c ft_lstlast.c ft_lstmap.c ft_lstnew.c ft_lstsize.c
LIST		:=	$(SRC_LIST:%=$(LIST_DIR)/%)

# MEMORY
MEM_DIR		:=	memory
SRC_MEM		:=	ft_bzero.c ft_calloc.c ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c
MEM			:=	$(SRC_MEM:%=$(MEM_DIR)/%)

# PRINT
PRINT_DIR	:=	print
SRC_PRINT	:=	ft_putchar.c ft_putchar_fd.c ft_putendl_fd.c ft_puthexa.c ft_puthexa_u.c ft_putnbr_base.c ft_putnbr_fd.c ft_putstr.c ft_putstr_fd.c ft_putunbr_base.c
PRINT		:=	$(SRC_PRINT:%=$(PRINT_DIR)/%)

# STRING
STRING_DIR	:=	string
SRC_STRING	:=	ft_atof.c ft_atoi.c ft_itoa.c ft_nbrlen_base.c ft_ptr_setstring.c ft_split.c ft_strcapitalize.c ft_strchr.c ft_strcmp.c ft_strdup.c ft_striteri.c ft_strjoin.c ft_strlcat.c ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_strtrim.c ft_substr.c ft_tolower.c ft_toupper.c ft_unbrlen_base.c
STRING		:=	$(SRC_STRING:%=$(STRING_DIR)/%)

#ALL SOURCES
SRCS_DIR	:=	src
ALL_SRCS	:=	$(CHECK) $(LIST) $(MEM) $(PRINT) $(STRING)
SRCS		:=	$(ALL_SRCS:%=$(SRCS_DIR)/%)

# OBJECTS
OBJS_DIR	:=	.objs
OBJS		:=	$(addprefix $(OBJS_DIR)/, $(SRCS:%.c=%.o))

# **************************************************************************** #
# 								     RULES									   #
# **************************************************************************** #

all: $(NAME)

$(OBJS_DIR)/%.o: %.c
	$(MK) $(@D)
	@printf "\r$(LBLUE)[$(RESET)$(CMP)$(LBLUE)] $(RESET)Compilation in progress... $(GREEN)$<$(BLUE) [$(RESET)$(CMP)$(BLUE)/$(RESET)$(FILE)$(BLUE)]$(RESET)                        \r"
	$(CC) $(CFLAGS) $(IFLAGS) -c $< -o  $@
	@$(eval CMP=$(shell echo $$(($(CMP)+1))))

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	$(RNBW)	

clean:
	$(RM) $(OBJS_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

# **************************************************************************** #
# 								 EXTRA RULES								   #
# **************************************************************************** #

run: re
	-./$(NAME)

info-%:
	$(MAKE) --dry-run --always-make $* | grep -v "info"

print-%:
	$(info '$*'='$($*)')

update:
	git stash
	git pull
	git submodule update --init
	git stash pop

.PHONY: all clean fclean re run update
