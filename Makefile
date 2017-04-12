PROJECT = seki
VERSION = 0.1.4

SRC_DIR = sources
OBJ_DIR = objects

STANDARD = -std=c99
WARNINGS = -pedantic -Wall -Wextra
DEFINES  = -DNAME="\"$(PROJECT)\"" -DVERSION="\"$(VERSION)\""
CFLAGS   = $(STANDARD) $(WARNINGS) $(DEFINES)

PREFIX    ?= /usr/local
BINPREFIX  = $(PREFIX)/bin
MANPREFIX  = $(PREFIX)/share/man

SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SOURCES))

.PHONY: all prepare build clean docs install uninstall

all: build # docs

prepare:
	@mkdir -p $(OBJ_DIR)

build: $(PROJECT)

$(PROJECT): $(OBJECTS)
	@echo " LD $@"
	@$(CC) $(LDFLAGS) $(LDLIBS) -o $@ $(OBJECTS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c prepare
	@echo " CC $@"
	@$(CC) $(CFLAGS) -c -o $@ $<

install: all
	@install -D -m 755 -t "$(DESTDIR)$(BINPREFIX)" $(EXE)

uninstall:
	@$(RM) "$(DESTDIR)$(BINPREFIX)/$(EXE)"

clean:
	@$(RM) $(PROJECT)
	@$(RM) -r $(OBJ_DIR)

# TODO: Implement
docs:
	@false
