SRC := \
	ast.c \
	parser.tab.c \
	lexer.c \
	codegen.c \
	main.c

OBJ := $(SRC:%.c=%.o)

PRG := toy

.PHONY: all clean

all: $(PRG)

$(PRG): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

parser.tab.c: parser.y
	bison -d -v parser.y

lexer.c: lexer.l parser.tab.c
	flex -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f $(OBJ) $(PRG) parser.tab.c parser.tab.h parser.output lexer.c
