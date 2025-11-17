# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marudlof <marudlof@42angouleme.fr>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/13 11:28:44 by marudlof          #+#    #+#              #
#    Updated: 2025/11/17 13:41:06 by marudlof         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
# 								NAME PROJECT				   				   #
# **************************************************************************** #
NAME	=	libft.a

# **************************************************************************** #
#								COMMANDS									   #
# **************************************************************************** #

AR		=	@ar rcs
CC		=	@cc
CFLAGS	=	-Wall -Wextra -Werror
IFLAGS	=	-Iincludes
MK		=	@mkdir -p
RM		=	@rm -rf
FILE	=	$(shell ls -lR srcs/ | grep -F .c | wc -l)
CMP		=	1
CLEAR	=	@clear

# **************************************************************************** #
# 								   COLORS				   					   #
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
# 								   PRINTS				  					   #
# **************************************************************************** #
RNBW	=	@printf "                                                                    \r$(RED)Lib$(ORANGE)ft$(YELLOW) is$(GREEN) re$(LBLUE)ady $(INDI)to $(PURPLE)use$(RESET)\n"

# **************************************************************************** #
# 								   SOURCES				     				   #
# **************************************************************************** #
# CHECK
CHECK_DIR	:=	check
SRC_CHECK	:=	ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c ft_isspace.c
CHECK		:=	$(SRC_CHECK:%=$(CHECK_DIR)/%)

#LIST
LIST_DIR	:=	list
SRC_LIST	:=	ft_lstadd_back.c ft_lstadd_front.c ft_lstclear.c ft_lstdelone.c ft_lstiter.c ft_lstlast.c ft_lstmap.c ft_lstnew.c ft_lstsize.c
LIST		:=	$(SRC_LIST:%=$(LIST_DIR)/%)

#DBLIST
DBLIST_DIR	:=	dblist
SRC_DBLIST	:=	ft_dbadd_back.c ft_dbadd_front.c ft_dbclear.c ft_dbdelone.c ft_dbiter.c ft_dblast.c ft_dbmap.c ft_dbnew.c ft_dbsize.c
DBLIST		:=	$(SRC_DBLIST:%=$(DBLIST_DIR)/%)

# MEMORY
MEM_DIR		:=	memory
SRC_MEM		:=	ft_bzero.c ft_calloc.c ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c ft_freeptr.c
MEM			:=	$(SRC_MEM:%=$(MEM_DIR)/%)

# PRINT
PRINT_DIR	:=	print
SRC_PRINT	:=	ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c ft_putnbr_base_fd.c ft_putunbr_base_fd.c ft_puthexa_fd.c ft_putuhexa_fd.c ft_printf.c
PRINT		:=	$(SRC_PRINT:%=$(PRINT_DIR)/%)

# STRING
STRING_DIR	:=	string
SRC_STRING	:=	ft_atoi.c ft_itoa.c ft_split.c ft_strchr.c ft_strdup.c ft_striteri.c ft_strjoin.c ft_strlcat.c ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_strtrim.c ft_substr.c ft_tolower.c ft_toupper.c ft_nbrlen_base.c ft_unbrlen_base.c ft_atol.c
STRING		:=	$(SRC_STRING:%=$(STRING_DIR)/%)

# TREE
TREE_DIR	:=	tree
SRC_TREE	:=	btree_create_node.c btree_apply_prefix.c btree_apply_infix.c btree_apply_suffix.c btree_insert_data.c btree_search_item.c btree_level_count.c btree_apply_by_level.c btree_free.c
TREE		:=	$(SRC_TREE:%=$(TREE_DIR)/%)

#ALL SOURCES
SRCS_DIR	:=	srcs
ALL_SRCS	:=	$(CHECK) $(MEM) $(PRINT) $(STRING) $(LIST) $(DBLIST) $(TREE)
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
	$(AR) $(NAME) $(OBJS)
	$(RNBW)	

clean:
	$(RM) $(OBJS_DIR)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re bonus
