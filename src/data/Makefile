# Generated automatically from Makefile.in by configure.
# Cold driver

CFLAGS=-g -O -I../include
LDFLAGS=
LIBS=-lgdbm -lm -lnsl
CC=gcc
RANLIB=
LINT=
YACC=bison -y

SYS=gnu
CPU=i686_pc
VENDOR=linux

prefix=/home/spitball/builds/Genesis-1.1.12-STABLE
BINDIR=$(prefix)/bin
SRCDIR=$(prefix)/src

VERSION=1.1.12-STABLE

OBJS = data.o buffer.o dict.o ident.o list.o object.o string.o \
       handled_frob.o quickhash.o

SRCS = `echo $(CDC_OBJS) $(COLDCORE_O) | sed -e 's/\.o/.c/g'`

#######
# rules

all: $(OBJS)

clean:
	rm -f *~ *.BAK *.bak

scrub:
	rm -f *.o *~ *.BAK *.bak

makefile:
	@cd $(prefix); configure -q

depend:
	@makedepend -- $(CFLAGS) -- $(SRCS) > /dev/null 2>&1
	@rm Makefile.bak

lint:
	$(LINT) -u $(SRCS)

patchable: scrub
	@chmod -f u+w Makefile
	@rm -f Makefile

include/parse.h:
	cd ../; make grammar.o include/parse.h
# DO NOT DELETE
