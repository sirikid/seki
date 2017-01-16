PROJECT = seki
VERSION = 0.1.4

STANDARD = -std=c99
WARNINGS = -pedantic -Wall -Wextra
DEFINES  = -DNAME="\"$(PROJECT)\"" -DVERSION="\"$(VERSION)\""

CFLAGS = $(STANDARD) $(WARNINGS) $(DEFINES)

PREFIX    ?= /usr/local
BINPREFIX ?= $(PREFIX)/bin
MANPREFIX ?= $(PREFIX)/share/man

SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:.c=.o)

EXE = $(PROJECT)
MAN = $(PROJECT).1

all: $(EXE)

$(EXE): $(OBJECTS)
	@echo " LD $@"
	@$(CC) $(LDFLAGS) $(OBJECTS) $(LDLIBS) -o $@

.c.o:
	@echo " CC $<"
	@$(CC) $(CFLAGS) -c -o $@ $<

install: $(EXE)
	@install -D -m 755 -t "$(DESTDIR)$(BINPREFIX)" $(EXE)
	@install -D -m 644 -t "$(DESTDIR)$(MANPREFIX)/man1" $(MAN)

uninstall:
	@$(RM) "$(DESTDIR)$(BINPREFIX)/$(EXE)"

clean:
	@$(RM) $(EXE) $(OBJECTS)

.PHONY: all clean install uninstall
