VERSION = 0.1.1

CC     ?= gcc
CFLAGS += -std=c99 -pedantic -Wall -Wextra

PREFIX   ?= /usr/local
BINPREFIX = $(PREFIX)/bin

SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)

.c.o:
	@echo " CC $<"
	@$(CC) -c -o $@ $<

desu: $(OBJ)
	@echo " LD $@"
	@$(CC) -o $@ $(OBJ) $(LDFLAGS)

install:
	@mkdir -p "$(DESTDIR)$(BINPREFIX)"
	@cp -p desu "$(DESTDIR)$(BINPREFIX)"

uninstall:
	@rm -f "$(DESTDIR)$(BINPREFIX)/desu"

clean:
	@rm -f $(OBJ) desu

.PHONY: all clean install uninstall
