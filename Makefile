NAME        = so_long

# Dossiers
SRC_DIR     = src
OBJ_DIR     = obj
INC_DIR     = include

# Fichiers sources et objets
SRCS        = $(wildcard $(SRC_DIR)/*.c)
OBJS        = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

# Compilation
CC          = cc
CFLAGS      = -Wall -Wextra -Werror -g -I$(INC_DIR)

# Détection système
UNAME_S     := $(shell uname -s)

ifeq ($(UNAME_S), Darwin)
    MLX_DIR = mlx_opengl
    MLX_FLAGS = -I$(MLX_DIR) -L$(MLX_DIR) -lmlx -framework OpenGL -framework AppKit
else
    MLX_DIR = mlx
    MLX_FLAGS = -I$(MLX_DIR) -L$(MLX_DIR) -lmlx -lXext -lX11 -lm -lz
endif

# Commandes
RM          = rm -rf
MKDIR       = mkdir -p

# Règles
all: $(OBJ_DIR) $(NAME)

$(OBJ_DIR):
	$(MKDIR) $(OBJ_DIR)

$(NAME): $(OBJS)
	@make -C libft
	@make -C printf
	$(CC) $(OBJS) $(CFLAGS) $(MLX_FLAGS) -Ilibft -Iprintf -Llibft -lft -Lprintf -lftprintf -o $(NAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -I$(MLX_DIR) -c $< -o $@

clean:
	$(RM) $(OBJ_DIR)

fclean: clean
	@make fclean -C libft
	@make fclean -C printf
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
