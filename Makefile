## Copyright 2025 Nicolas Spijkerman
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.

LFLAGS	=	-L./ -lasm

SRC	 	=	src/memcpy.asm \
			src/memmove.asm \
			src/memset.asm \
			src/strcasecmp.asm \
			src/strchr.asm \
			src/strcmp.asm \
			src/strcspn.asm \
			src/strlen.asm \
			src/strncmp.asm \
			src/strpbrk.asm \
			src/strrchr.asm \
			src/strstr.asm

OBJ  	=	$(SRC:.asm=.o)

NAME 	= 	libasm.so

.PHONY: all clean fclean re

%.o: %.asm
	nasm -f elf64 $< -o $@

all: $(OBJ)
	ld -fpic -shared $(OBJ) -o $(NAME)

test: re
	$(CC) ./tests/main.c -o execute_test
	clear
	@./execute_test

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME) ./execute_test

re: fclean all
