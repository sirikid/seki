VERSION = 0.1.1

CC     ?= gcc
CFLAGS += -std=c99 -pedantic -Wall -Wextra

PREFIX   ?= /usr/local
BINPREFIX = $(PREFIX)/bin

SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)
BIN = seki

all: $(BIN)

.c.o:
	@echo " CC $<"
	@$(CC) -c -o $@ $<

$(BIN): $(OBJ)
	@echo " LD $@"
	@$(CC) -o $@ $(OBJ) $(LDFLAGS)

install:
	@mkdir -p "$(DESTDIR)$(BINPREFIX)"
	@cp -p $(BIN) "$(DESTDIR)$(BINPREFIX)"

uninstall:
	@rm -f "$(DESTDIR)$(BINPREFIX)/$(BIN)"

clean:
	@rm -f $(OBJ) $(BIN)

.PHONY: all clean install uninstall
