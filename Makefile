DESTDIR?=/usr
PREFIX?=/local

ifneq ($V,1)
Q ?= @
endif

CC	= gcc
CFLAGS	= $(DEBUG) -Wall -Wextra $(INCLUDE) -Winline -pipe 

LDFLAGS	= -L$(DESTDIR)$(PREFIX)/lib
LIBS    = -lpthread -lrt -lm -lcrypt

SRC	=	src/relay.c src/comm.c src/thread.c

OBJ	=	$(SRC:.c=.o)

all:	8relayhv

8relayhv:	$(OBJ)
	$Q echo [Link]
	$Q $(CC) -o $@ $(OBJ) $(LDFLAGS) $(LIBS)

.c.o:
	$Q echo [Compile] $<
	$Q $(CC) -c $(CFLAGS) $< -o $@

.PHONY:	clean
clean:
	$Q echo "[Clean]"
	$Q rm -f $(OBJ) 8relayhv *~ core tags *.bak

.PHONY:	install
install: 8relayhv
	$Q echo "[Install]"
	$Q cp 8relayhv		$(DESTDIR)$(PREFIX)/bin
ifneq ($(WIRINGPI_SUID),0)
	$Q chown root.root	$(DESTDIR)$(PREFIX)/bin/8relayhv
	$Q chmod 4755		$(DESTDIR)$(PREFIX)/bin/8relayhv
endif


.PHONY:	uninstall
uninstall:
	$Q echo "[UnInstall]"
	$Q rm -f $(DESTDIR)$(PREFIX)/bin/8relayhv
	$Q rm -f $(DESTDIR)$(PREFIX)/man/man1/8relayhv.1
