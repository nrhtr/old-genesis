# Generated automatically from Makefile.in by configure.
# Genesis, the ColdC driver

INCLUDE=-Iinclude -Imodules
CFLAGS=-g -O0 $(INCLUDE)
MCFLAGS=`echo $(CFLAGS) | sed -e 's:-pedantic::'`
LIBS=-lgdbm -lgdbm_compat -lm -lnsl
LDFLAGS= -Lmodules
CC=gcc
RANLIB=
LINT=
YACC=bison -y
YFLAGS=--defines=include/parse.h -o grammar.c

SYS=gnu
CPU=i686_pc
VENDOR=linux

prefix=/home/nrhtr/github/genesis
MODE=755
USER=nrhtr
BINDIR=$(prefix)/bin
SRCDIR=$(prefix)/src
MODULES=$(SRCDIR)/modules
OPSDIR=$(SRCDIR)/ops
DATADIR=$(SRCDIR)/data
TESTDIR=$(prefix)/test

VERSION=1.1.12-STABLE
VMAJOR=1
VMINOR=1
VPATCH=12
INSTALL=$(prefix)/bin

DATA_O     = data/data.o data/buffer.o data/dict.o data/ident.o\
             data/list.o data/object.o data/string.o \
	     data/handled_frob.o data/quickhash.o
GRAMMAR_O  = grammar.o
DB_O       = cache.o binarydb.o dbpack.o decode.o lookup.o
IO_O       = io.o log.o net.o file.o
MISC_O     = strutil.o memory.o sig.o util.o regexp.o defs.o dns.o
OPS_O      = ops/operators.o ops/buffer.o ops/error.o ops/list.o\
             ops/object.o ops/dict.o ops/string.o ops/data.o ops/sys.o\
             ops/misc.o ops/task.o ops/file.o ops/network.o ops/math.o
CRYPT_O    = shs.o crypt.o
PCODE_O    = codegen.o execute.o opcodes.o token.o native.o
MOD_O      = modules/cdc.o modules/cdc_buffer.o modules/cdc_dict.o modules/cdc_list.o modules/cdc_misc.o modules/cdc_string.o modules/cdc_integer.o modules/web.o modules/ext_math.o
OMOD_O     = `echo $(MOD_O) | sed -e 's/modules\///g'`
COMMON_O   = $(DATA_O) $(DB_O) $(IO_O) $(MISC_O) \
             $(PCODE_O) $(OPS_O) $(MOD_O) $(CRYPT_O)
DRIVER_O   = $(GRAMMAR_O) genesis.o $(COMMON_O)
COMPILER_O = $(GRAMMAR_O) coldcc.o textdb.o $(COMMON_O)
CONTROL_O  = control.o

EVERYTHING_O = genesis.o control.o coldcc.o $(COMMON_O)
EVERYTHING_C = `echo $(EVERYTHING_O) | sed -e 's/\.o/.c/g'`

DRIVER = genesis
COMPILER = coldcc
CONTROL = control

EXES = $(COMPILER) $(DRIVER)

all: $(GRAMMAR_O) include/parse.h Data Modules Ops $(EXES)

mytest: dict_test.c $(COMPILER_O)
	gcc $(INCLUDE) $(LIBS) $(COMMON_O) $(GRAMMAR_O) dict_test.c -o test

Data:
	@echo "data objects..."
	@cd $(DATADIR); make

Modules:
	@echo "module objects..."
	@cd $(MODULES); make $(OMOD_O)

Ops:
	@echo "operator and function objects..."
	@cd $(OPSDIR); make

$(DRIVER): $(DRIVER_O)
	$(CC) $(CFLAGS) $(LDFLAGS) $(DRIVER_O) $(LIBS) -o $@

$(COMPILER): $(COMPILER_O)
	$(CC) $(CFLAGS) $(LDFLAGS) $(COMPILER_O) $(LIBS) -o $@

clean:
	rm -f include/parse.h grammar.c *~ *.BAK *.bak y.output *.core
	rm -f $(EXES)
	cd $(SRCDIR); rm -f $(EXES)
	@cd $(MODULES); make $@
	@cd $(OPSDIR); make $@
	@cd $(DATADIR); make $@

scrub:
	rm -f *.o include/parse.h grammar.c *~ *.BAK *.bak y.output *.core
	rm -f textdump*
	rm -f $(EXES)
	cd $(SRCDIR); rm -f $(EXES)
	rm -rf binary binary.bak
	@cd $(MODULES); make $@
	@cd $(OPSDIR); make $@
	@cd $(DATADIR); make $@

commitable:
	@cd $(MODULES); ./modbuild -m0 cdc web ext_math

commit: commitable
	cvs commit

makefiles: makefile

makefile:
	@cd ..; etc/config.status

test: all
	@cd $(TESTDIR);\
		ln -sf $(SRCDIR)/coldcc;\
		./runtest $(TESTDIR)

install: all
	@$(SRCDIR)/INSTALL.sh $(USER) $(MODE) $(INSTALL) $(prefix)

depend: $(GRAMMAR_O) include/parse.h
	@echo modules..
	@cd $(MODULES); make $@
	@echo ops..
	@cd $(OPSDIR); make $@
	@echo data..
	@cd $(DATADIR); make $@
	@makedepend -- $(CFLAGS) -- $(EVERYTHING_C) > /dev/null 2>&1
	@rm -f Makefile.bak

lint:
	$(LINT) $(INCLUDE) -u $(EVERYTHING_C)

# I duplicate scrub because of the recusion involved in calling modules
patchable: commitable
	rm -f *.o include/parse.h grammar.c *~ *.BAK *.bak y.output *.core
	rm -rf binary
	rm -f textdump*
	rm -f $(EXES)
	cd $(SRCDIR); rm -f $(EXES)
	@cd $(MODULES); make $@
	@cd $(OPSDIR); make $@
	@cd $(DATADIR); make $@
	rm -f $(prefix)/etc/config.cache
	rm -f $(prefix)/etc/config.log
	rm -f $(prefix)/etc/config.status
	rm -f $(MODULES)/modbuild.last
	rm -f $(SRCDIR)/Makefile
	rm -f $(SRCDIR)/modules/Makefile
	rm -f $(SRCDIR)/include/config.h
	rm -f $(TESTDIR)/coldcc

reconfig: scrub config
config:
	@cd ../; configure

win32: Win32

include/parse.h: grammar.y
	$(YACC) $(YFLAGS) grammar.y

regrammar:
	@echo "generating parser source..."
	@$(YACC) $(YFLAGS) grammar.y
	@grep '#include' grammar.c > incs
	@grep -v '#include' grammar.c > out
	@cat incs out > grammar.c
	@rm incs out

Win32:
	@echo "cleaning heirarchy..."
	@make scrub 2>&1 > /dev/null
	@echo "creating config file..."
	@sed -e "s/#VMAJOR#/#define VERSION_MAJOR $(VMAJOR)/;\
                s/#VMINOR#/#define VERSION_MINOR $(VMINOR)/;\
                s/#VPATCH#/#define VERSION_PATCH $(VPATCH)/" include/config.h.win32 > include/config.h
	@echo "generating parser source..."
	@$(YACC) $(YFLAGS) grammar.y
	@grep '#include' grammar.c > incs
	@grep -v '#include' grammar.c > out
	@cat incs out > grammar.c
	@rm incs out
# DO NOT DELETE

genesis.o: include/defs.h include/config.h /usr/include/stdlib.h
genesis.o: /usr/include/features.h /usr/include/sys/cdefs.h
genesis.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
genesis.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
genesis.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
genesis.o: /usr/include/time.h /usr/include/endian.h
genesis.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
genesis.o: /usr/include/sys/select.h /usr/include/bits/select.h
genesis.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
genesis.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
genesis.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
genesis.o: /usr/include/_G_config.h /usr/include/wchar.h
genesis.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
genesis.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
genesis.o: /usr/include/bits/confname.h /usr/include/getopt.h
genesis.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
genesis.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
genesis.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
genesis.o: /usr/include/asm-generic/errno.h
genesis.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
genesis.o: include/regexp.h include/io.h include/net.h include/ident.h
genesis.o: include/object.h include/file.h /usr/include/sys/stat.h
genesis.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
genesis.o: include/buffer.h include/dict.h include/data.h
genesis.o: include/cdc_memory.h /usr/include/string.h include/log.h
genesis.o: include/parse.h /usr/include/sys/time.h /usr/include/sys/wait.h
genesis.o: /usr/include/signal.h /usr/include/bits/signum.h
genesis.o: /usr/include/bits/siginfo.h /usr/include/bits/sigaction.h
genesis.o: /usr/include/bits/sigcontext.h /usr/include/asm/sigcontext.h
genesis.o: /usr/include/asm/types.h /usr/include/asm-generic/int-ll64.h
genesis.o: /usr/include/bits/sigstack.h /usr/include/bits/sigthread.h
genesis.o: /usr/include/sys/resource.h /usr/include/bits/resource.h
genesis.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
genesis.o: /usr/include/grp.h /usr/include/pwd.h /usr/include/ctype.h
genesis.o: include/cdc_pcode.h include/grammar.h include/token.h
genesis.o: include/codegen.h include/code_prv.h include/execute.h
genesis.o: include/macros.h include/native.h include/util.h include/opcodes.h
genesis.o: include/decode.h include/cdc_db.h include/cache.h
genesis.o: include/binarydb.h include/dbpack.h include/lookup.h
genesis.o: include/strutil.h include/sig.h
control.o: include/defs.h include/config.h /usr/include/stdlib.h
control.o: /usr/include/features.h /usr/include/sys/cdefs.h
control.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
control.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
control.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
control.o: /usr/include/time.h /usr/include/endian.h
control.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
control.o: /usr/include/sys/select.h /usr/include/bits/select.h
control.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
control.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
control.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
control.o: /usr/include/_G_config.h /usr/include/wchar.h
control.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
control.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
control.o: /usr/include/bits/confname.h /usr/include/getopt.h
control.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
control.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
control.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
control.o: /usr/include/asm-generic/errno.h
control.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
control.o: include/regexp.h include/io.h include/net.h include/ident.h
control.o: include/object.h include/file.h /usr/include/sys/stat.h
control.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
control.o: include/buffer.h include/dict.h include/data.h
control.o: include/cdc_memory.h /usr/include/string.h include/log.h
control.o: include/parse.h
coldcc.o: include/defs.h include/config.h /usr/include/stdlib.h
coldcc.o: /usr/include/features.h /usr/include/sys/cdefs.h
coldcc.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
coldcc.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
coldcc.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
coldcc.o: /usr/include/time.h /usr/include/endian.h
coldcc.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
coldcc.o: /usr/include/sys/select.h /usr/include/bits/select.h
coldcc.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
coldcc.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
coldcc.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
coldcc.o: /usr/include/_G_config.h /usr/include/wchar.h
coldcc.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
coldcc.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
coldcc.o: /usr/include/bits/confname.h /usr/include/getopt.h
coldcc.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h include/cdc_errs.h
coldcc.o: /usr/include/errno.h /usr/include/bits/errno.h
coldcc.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
coldcc.o: /usr/include/asm-generic/errno.h
coldcc.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
coldcc.o: include/regexp.h include/io.h include/net.h include/ident.h
coldcc.o: include/object.h include/file.h /usr/include/sys/stat.h
coldcc.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
coldcc.o: include/buffer.h include/dict.h include/data.h include/cdc_memory.h
coldcc.o: /usr/include/string.h include/log.h include/parse.h
coldcc.o: /usr/include/signal.h /usr/include/bits/signum.h
coldcc.o: /usr/include/bits/siginfo.h /usr/include/bits/sigaction.h
coldcc.o: /usr/include/bits/sigcontext.h /usr/include/asm/sigcontext.h
coldcc.o: /usr/include/asm/types.h /usr/include/asm-generic/int-ll64.h
coldcc.o: /usr/include/bits/sigstack.h /usr/include/bits/sigthread.h
coldcc.o: /usr/include/ctype.h include/cdc_pcode.h include/grammar.h
coldcc.o: include/token.h include/codegen.h include/code_prv.h
coldcc.o: include/execute.h include/macros.h include/native.h include/util.h
coldcc.o: include/opcodes.h include/decode.h include/cdc_db.h include/cache.h
coldcc.o: include/binarydb.h include/dbpack.h include/lookup.h
coldcc.o: include/textdb.h include/strutil.h include/sig.h modules/moddef.h
coldcc.o: modules/cdc.h modules/web.h modules/ext_math.h
data/data.o: include/defs.h include/config.h /usr/include/stdlib.h
data/data.o: /usr/include/features.h /usr/include/sys/cdefs.h
data/data.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
data/data.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
data/data.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
data/data.o: /usr/include/time.h /usr/include/endian.h
data/data.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
data/data.o: /usr/include/sys/select.h /usr/include/bits/select.h
data/data.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
data/data.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
data/data.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
data/data.o: /usr/include/_G_config.h /usr/include/wchar.h
data/data.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
data/data.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
data/data.o: /usr/include/bits/confname.h /usr/include/getopt.h
data/data.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
data/data.o: include/cdc_errs.h /usr/include/errno.h
data/data.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
data/data.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
data/data.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
data/data.o: include/regexp.h include/io.h include/net.h include/ident.h
data/data.o: include/object.h include/file.h /usr/include/sys/stat.h
data/data.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
data/data.o: include/buffer.h include/dict.h include/data.h
data/data.o: include/cdc_memory.h /usr/include/string.h include/log.h
data/data.o: include/parse.h /usr/include/ctype.h include/util.h
data/data.o: include/cache.h include/token.h include/lookup.h
data/data.o: include/macros.h include/native.h include/execute.h
data/data.o: include/handled_frob.h
data/buffer.o: include/defs.h include/config.h /usr/include/stdlib.h
data/buffer.o: /usr/include/features.h /usr/include/sys/cdefs.h
data/buffer.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
data/buffer.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
data/buffer.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
data/buffer.o: /usr/include/time.h /usr/include/endian.h
data/buffer.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
data/buffer.o: /usr/include/sys/select.h /usr/include/bits/select.h
data/buffer.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
data/buffer.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
data/buffer.o: /usr/include/alloca.h /usr/include/stdio.h
data/buffer.o: /usr/include/libio.h /usr/include/_G_config.h
data/buffer.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
data/buffer.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
data/buffer.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
data/buffer.o: /usr/include/getopt.h /usr/include/setjmp.h
data/buffer.o: /usr/include/bits/setjmp.h include/cdc_errs.h
data/buffer.o: /usr/include/errno.h /usr/include/bits/errno.h
data/buffer.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
data/buffer.o: /usr/include/asm-generic/errno.h
data/buffer.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
data/buffer.o: include/regexp.h include/io.h include/net.h include/ident.h
data/buffer.o: include/object.h include/file.h /usr/include/sys/stat.h
data/buffer.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
data/buffer.o: include/buffer.h include/dict.h include/data.h
data/buffer.o: include/cdc_memory.h /usr/include/string.h include/log.h
data/buffer.o: include/parse.h /usr/include/ctype.h include/util.h
data/dict.o: include/defs.h include/config.h /usr/include/stdlib.h
data/dict.o: /usr/include/features.h /usr/include/sys/cdefs.h
data/dict.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
data/dict.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
data/dict.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
data/dict.o: /usr/include/time.h /usr/include/endian.h
data/dict.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
data/dict.o: /usr/include/sys/select.h /usr/include/bits/select.h
data/dict.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
data/dict.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
data/dict.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
data/dict.o: /usr/include/_G_config.h /usr/include/wchar.h
data/dict.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
data/dict.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
data/dict.o: /usr/include/bits/confname.h /usr/include/getopt.h
data/dict.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
data/dict.o: include/cdc_errs.h /usr/include/errno.h
data/dict.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
data/dict.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
data/dict.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
data/dict.o: include/regexp.h include/io.h include/net.h include/ident.h
data/dict.o: include/object.h include/file.h /usr/include/sys/stat.h
data/dict.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
data/dict.o: include/buffer.h include/dict.h include/data.h
data/dict.o: include/cdc_memory.h /usr/include/string.h include/log.h
data/dict.o: include/parse.h
data/ident.o: include/defs.h include/config.h /usr/include/stdlib.h
data/ident.o: /usr/include/features.h /usr/include/sys/cdefs.h
data/ident.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
data/ident.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
data/ident.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
data/ident.o: /usr/include/time.h /usr/include/endian.h
data/ident.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
data/ident.o: /usr/include/sys/select.h /usr/include/bits/select.h
data/ident.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
data/ident.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
data/ident.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
data/ident.o: /usr/include/_G_config.h /usr/include/wchar.h
data/ident.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
data/ident.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
data/ident.o: /usr/include/bits/confname.h /usr/include/getopt.h
data/ident.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
data/ident.o: include/cdc_errs.h /usr/include/errno.h
data/ident.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
data/ident.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
data/ident.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
data/ident.o: include/regexp.h include/io.h include/net.h include/ident.h
data/ident.o: include/object.h include/file.h /usr/include/sys/stat.h
data/ident.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
data/ident.o: include/buffer.h include/dict.h include/data.h
data/ident.o: include/cdc_memory.h /usr/include/string.h include/log.h
data/ident.o: include/parse.h include/util.h
data/list.o: include/defs.h include/config.h /usr/include/stdlib.h
data/list.o: /usr/include/features.h /usr/include/sys/cdefs.h
data/list.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
data/list.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
data/list.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
data/list.o: /usr/include/time.h /usr/include/endian.h
data/list.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
data/list.o: /usr/include/sys/select.h /usr/include/bits/select.h
data/list.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
data/list.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
data/list.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
data/list.o: /usr/include/_G_config.h /usr/include/wchar.h
data/list.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
data/list.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
data/list.o: /usr/include/bits/confname.h /usr/include/getopt.h
data/list.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
data/list.o: include/cdc_errs.h /usr/include/errno.h
data/list.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
data/list.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
data/list.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
data/list.o: include/regexp.h include/io.h include/net.h include/ident.h
data/list.o: include/object.h include/file.h /usr/include/sys/stat.h
data/list.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
data/list.o: include/buffer.h include/dict.h include/data.h
data/list.o: include/cdc_memory.h /usr/include/string.h include/log.h
data/list.o: include/parse.h include/quickhash.h
data/object.o: include/defs.h include/config.h /usr/include/stdlib.h
data/object.o: /usr/include/features.h /usr/include/sys/cdefs.h
data/object.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
data/object.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
data/object.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
data/object.o: /usr/include/time.h /usr/include/endian.h
data/object.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
data/object.o: /usr/include/sys/select.h /usr/include/bits/select.h
data/object.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
data/object.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
data/object.o: /usr/include/alloca.h /usr/include/stdio.h
data/object.o: /usr/include/libio.h /usr/include/_G_config.h
data/object.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
data/object.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
data/object.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
data/object.o: /usr/include/getopt.h /usr/include/setjmp.h
data/object.o: /usr/include/bits/setjmp.h include/cdc_errs.h
data/object.o: /usr/include/errno.h /usr/include/bits/errno.h
data/object.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
data/object.o: /usr/include/asm-generic/errno.h
data/object.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
data/object.o: include/regexp.h include/io.h include/net.h include/ident.h
data/object.o: include/object.h include/file.h /usr/include/sys/stat.h
data/object.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
data/object.o: include/buffer.h include/dict.h include/data.h
data/object.o: include/cdc_memory.h /usr/include/string.h include/log.h
data/object.o: include/parse.h include/cdc_pcode.h include/grammar.h
data/object.o: include/token.h include/codegen.h include/code_prv.h
data/object.o: include/execute.h include/macros.h include/native.h
data/object.o: include/util.h include/opcodes.h include/decode.h
data/object.o: include/cdc_db.h include/cache.h include/binarydb.h
data/object.o: include/dbpack.h include/lookup.h include/quickhash.h
data/string.o: include/defs.h include/config.h /usr/include/stdlib.h
data/string.o: /usr/include/features.h /usr/include/sys/cdefs.h
data/string.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
data/string.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
data/string.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
data/string.o: /usr/include/time.h /usr/include/endian.h
data/string.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
data/string.o: /usr/include/sys/select.h /usr/include/bits/select.h
data/string.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
data/string.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
data/string.o: /usr/include/alloca.h /usr/include/stdio.h
data/string.o: /usr/include/libio.h /usr/include/_G_config.h
data/string.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
data/string.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
data/string.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
data/string.o: /usr/include/getopt.h /usr/include/setjmp.h
data/string.o: /usr/include/bits/setjmp.h include/cdc_errs.h
data/string.o: /usr/include/errno.h /usr/include/bits/errno.h
data/string.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
data/string.o: /usr/include/asm-generic/errno.h
data/string.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
data/string.o: include/regexp.h include/io.h include/net.h include/ident.h
data/string.o: include/object.h include/file.h /usr/include/sys/stat.h
data/string.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
data/string.o: include/buffer.h include/dict.h include/data.h
data/string.o: include/cdc_memory.h /usr/include/string.h include/log.h
data/string.o: include/parse.h include/dbpack.h include/util.h
data/handled_frob.o: include/defs.h include/config.h /usr/include/stdlib.h
data/handled_frob.o: /usr/include/features.h /usr/include/sys/cdefs.h
data/handled_frob.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
data/handled_frob.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
data/handled_frob.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
data/handled_frob.o: /usr/include/time.h /usr/include/endian.h
data/handled_frob.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
data/handled_frob.o: /usr/include/sys/select.h /usr/include/bits/select.h
data/handled_frob.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
data/handled_frob.o: /usr/include/sys/sysmacros.h
data/handled_frob.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
data/handled_frob.o: /usr/include/stdio.h /usr/include/libio.h
data/handled_frob.o: /usr/include/_G_config.h /usr/include/wchar.h
data/handled_frob.o: /usr/include/bits/stdio_lim.h
data/handled_frob.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
data/handled_frob.o: /usr/include/bits/posix_opt.h
data/handled_frob.o: /usr/include/bits/confname.h /usr/include/getopt.h
data/handled_frob.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
data/handled_frob.o: include/cdc_errs.h /usr/include/errno.h
data/handled_frob.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
data/handled_frob.o: /usr/include/asm/errno.h
data/handled_frob.o: /usr/include/asm-generic/errno.h
data/handled_frob.o: /usr/include/asm-generic/errno-base.h
data/handled_frob.o: include/cdc_types.h include/regexp.h include/io.h
data/handled_frob.o: include/net.h include/ident.h include/object.h
data/handled_frob.o: include/file.h /usr/include/sys/stat.h
data/handled_frob.o: /usr/include/bits/stat.h include/list.h
data/handled_frob.o: include/cdc_string.h include/buffer.h include/dict.h
data/handled_frob.o: include/data.h include/cdc_memory.h
data/handled_frob.o: /usr/include/string.h include/log.h include/parse.h
data/handled_frob.o: include/cdc_pcode.h include/grammar.h include/token.h
data/handled_frob.o: include/codegen.h include/code_prv.h include/execute.h
data/handled_frob.o: include/macros.h include/native.h include/util.h
data/handled_frob.o: include/opcodes.h include/decode.h include/operators.h
data/handled_frob.o: include/lookup.h include/dbpack.h include/handled_frob.h
data/quickhash.o: include/defs.h include/config.h /usr/include/stdlib.h
data/quickhash.o: /usr/include/features.h /usr/include/sys/cdefs.h
data/quickhash.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
data/quickhash.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
data/quickhash.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
data/quickhash.o: /usr/include/time.h /usr/include/endian.h
data/quickhash.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
data/quickhash.o: /usr/include/sys/select.h /usr/include/bits/select.h
data/quickhash.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
data/quickhash.o: /usr/include/sys/sysmacros.h
data/quickhash.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
data/quickhash.o: /usr/include/stdio.h /usr/include/libio.h
data/quickhash.o: /usr/include/_G_config.h /usr/include/wchar.h
data/quickhash.o: /usr/include/bits/stdio_lim.h
data/quickhash.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
data/quickhash.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
data/quickhash.o: /usr/include/getopt.h /usr/include/setjmp.h
data/quickhash.o: /usr/include/bits/setjmp.h include/cdc_errs.h
data/quickhash.o: /usr/include/errno.h /usr/include/bits/errno.h
data/quickhash.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
data/quickhash.o: /usr/include/asm-generic/errno.h
data/quickhash.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
data/quickhash.o: include/regexp.h include/io.h include/net.h include/ident.h
data/quickhash.o: include/object.h include/file.h /usr/include/sys/stat.h
data/quickhash.o: /usr/include/bits/stat.h include/list.h
data/quickhash.o: include/cdc_string.h include/buffer.h include/dict.h
data/quickhash.o: include/data.h include/cdc_memory.h /usr/include/string.h
data/quickhash.o: include/log.h include/parse.h include/quickhash.h
cache.o: include/defs.h include/config.h /usr/include/stdlib.h
cache.o: /usr/include/features.h /usr/include/sys/cdefs.h
cache.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
cache.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
cache.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
cache.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
cache.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
cache.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
cache.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
cache.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
cache.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
cache.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
cache.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
cache.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
cache.o: /usr/include/getopt.h /usr/include/setjmp.h
cache.o: /usr/include/bits/setjmp.h include/cdc_errs.h /usr/include/errno.h
cache.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
cache.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
cache.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
cache.o: include/regexp.h include/io.h include/net.h include/ident.h
cache.o: include/object.h include/file.h /usr/include/sys/stat.h
cache.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
cache.o: include/buffer.h include/dict.h include/data.h include/cdc_memory.h
cache.o: /usr/include/string.h include/log.h include/parse.h include/cdc_db.h
cache.o: include/cache.h include/binarydb.h include/dbpack.h include/lookup.h
cache.o: include/util.h include/execute.h include/macros.h include/native.h
binarydb.o: include/defs.h include/config.h /usr/include/stdlib.h
binarydb.o: /usr/include/features.h /usr/include/sys/cdefs.h
binarydb.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
binarydb.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
binarydb.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
binarydb.o: /usr/include/time.h /usr/include/endian.h
binarydb.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
binarydb.o: /usr/include/sys/select.h /usr/include/bits/select.h
binarydb.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
binarydb.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
binarydb.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
binarydb.o: /usr/include/_G_config.h /usr/include/wchar.h
binarydb.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
binarydb.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
binarydb.o: /usr/include/bits/confname.h /usr/include/getopt.h
binarydb.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
binarydb.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
binarydb.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
binarydb.o: /usr/include/asm-generic/errno.h
binarydb.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
binarydb.o: include/regexp.h include/io.h include/net.h include/ident.h
binarydb.o: include/object.h include/file.h /usr/include/sys/stat.h
binarydb.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
binarydb.o: include/buffer.h include/dict.h include/data.h
binarydb.o: include/cdc_memory.h /usr/include/string.h include/log.h
binarydb.o: include/parse.h /usr/include/sys/param.h /usr/include/limits.h
binarydb.o: /usr/include/bits/posix1_lim.h /usr/include/bits/local_lim.h
binarydb.o: /usr/include/linux/limits.h /usr/include/bits/posix2_lim.h
binarydb.o: /usr/include/linux/param.h /usr/include/asm/param.h
binarydb.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
binarydb.o: /usr/include/ctype.h include/cdc_db.h include/cache.h
binarydb.o: include/binarydb.h include/dbpack.h include/lookup.h
binarydb.o: include/util.h modules/moddef.h include/native.h
binarydb.o: include/execute.h include/macros.h modules/cdc.h
binarydb.o: include/cdc_pcode.h include/grammar.h include/token.h
binarydb.o: include/codegen.h include/code_prv.h include/opcodes.h
binarydb.o: include/decode.h modules/web.h modules/ext_math.h
dbpack.o: include/defs.h include/config.h /usr/include/stdlib.h
dbpack.o: /usr/include/features.h /usr/include/sys/cdefs.h
dbpack.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
dbpack.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
dbpack.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
dbpack.o: /usr/include/time.h /usr/include/endian.h
dbpack.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
dbpack.o: /usr/include/sys/select.h /usr/include/bits/select.h
dbpack.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
dbpack.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
dbpack.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
dbpack.o: /usr/include/_G_config.h /usr/include/wchar.h
dbpack.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
dbpack.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
dbpack.o: /usr/include/bits/confname.h /usr/include/getopt.h
dbpack.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h include/cdc_errs.h
dbpack.o: /usr/include/errno.h /usr/include/bits/errno.h
dbpack.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
dbpack.o: /usr/include/asm-generic/errno.h
dbpack.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
dbpack.o: include/regexp.h include/io.h include/net.h include/ident.h
dbpack.o: include/object.h include/file.h /usr/include/sys/stat.h
dbpack.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
dbpack.o: include/buffer.h include/dict.h include/data.h include/cdc_memory.h
dbpack.o: /usr/include/string.h include/log.h include/parse.h
dbpack.o: include/cdc_db.h include/cache.h include/binarydb.h
dbpack.o: include/dbpack.h include/lookup.h include/macros.h include/native.h
dbpack.o: include/execute.h include/util.h
decode.o: include/defs.h include/config.h /usr/include/stdlib.h
decode.o: /usr/include/features.h /usr/include/sys/cdefs.h
decode.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
decode.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
decode.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
decode.o: /usr/include/time.h /usr/include/endian.h
decode.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
decode.o: /usr/include/sys/select.h /usr/include/bits/select.h
decode.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
decode.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
decode.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
decode.o: /usr/include/_G_config.h /usr/include/wchar.h
decode.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
decode.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
decode.o: /usr/include/bits/confname.h /usr/include/getopt.h
decode.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h include/cdc_errs.h
decode.o: /usr/include/errno.h /usr/include/bits/errno.h
decode.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
decode.o: /usr/include/asm-generic/errno.h
decode.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
decode.o: include/regexp.h include/io.h include/net.h include/ident.h
decode.o: include/object.h include/file.h /usr/include/sys/stat.h
decode.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
decode.o: include/buffer.h include/dict.h include/data.h include/cdc_memory.h
decode.o: /usr/include/string.h include/log.h include/parse.h
decode.o: include/cdc_pcode.h include/grammar.h include/token.h
decode.o: include/codegen.h include/code_prv.h include/execute.h
decode.o: include/macros.h include/native.h include/util.h include/opcodes.h
decode.o: include/decode.h
lookup.o: include/defs.h include/config.h /usr/include/stdlib.h
lookup.o: /usr/include/features.h /usr/include/sys/cdefs.h
lookup.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
lookup.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
lookup.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
lookup.o: /usr/include/time.h /usr/include/endian.h
lookup.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
lookup.o: /usr/include/sys/select.h /usr/include/bits/select.h
lookup.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
lookup.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
lookup.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
lookup.o: /usr/include/_G_config.h /usr/include/wchar.h
lookup.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
lookup.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
lookup.o: /usr/include/bits/confname.h /usr/include/getopt.h
lookup.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h include/cdc_errs.h
lookup.o: /usr/include/errno.h /usr/include/bits/errno.h
lookup.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
lookup.o: /usr/include/asm-generic/errno.h
lookup.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
lookup.o: include/regexp.h include/io.h include/net.h include/ident.h
lookup.o: include/object.h include/file.h /usr/include/sys/stat.h
lookup.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
lookup.o: include/buffer.h include/dict.h include/data.h include/cdc_memory.h
lookup.o: /usr/include/string.h include/log.h include/parse.h
lookup.o: /usr/include/sys/file.h /usr/include/fcntl.h
lookup.o: /usr/include/bits/fcntl.h include/cdc_db.h include/cache.h
lookup.o: include/binarydb.h include/dbpack.h include/lookup.h include/util.h
lookup.o: /usr/include/db.h /usr/include/inttypes.h /usr/include/stdint.h
lookup.o: /usr/include/bits/wchar.h /usr/include/pthread.h
lookup.o: /usr/include/sched.h /usr/include/bits/sched.h
lookup.o: /usr/include/signal.h /usr/include/bits/signum.h
lookup.o: /usr/include/bits/siginfo.h /usr/include/bits/sigaction.h
lookup.o: /usr/include/bits/sigcontext.h /usr/include/asm/sigcontext.h
lookup.o: /usr/include/asm/types.h /usr/include/asm-generic/int-ll64.h
lookup.o: /usr/include/bits/sigstack.h /usr/include/bits/sigthread.h
io.o: include/defs.h include/config.h /usr/include/stdlib.h
io.o: /usr/include/features.h /usr/include/sys/cdefs.h
io.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
io.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
io.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
io.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
io.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
io.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
io.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
io.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
io.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
io.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
io.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
io.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
io.o: /usr/include/getopt.h /usr/include/setjmp.h /usr/include/bits/setjmp.h
io.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
io.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
io.o: /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h
io.o: include/cdc_types.h include/regexp.h include/io.h include/net.h
io.o: include/ident.h include/object.h include/file.h /usr/include/sys/stat.h
io.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
io.o: include/buffer.h include/dict.h include/data.h include/cdc_memory.h
io.o: /usr/include/string.h include/log.h include/parse.h
io.o: /usr/include/ctype.h include/cdc_pcode.h include/grammar.h
io.o: include/token.h include/codegen.h include/code_prv.h include/execute.h
io.o: include/macros.h include/native.h include/util.h include/opcodes.h
io.o: include/decode.h include/cache.h
log.o: include/defs.h include/config.h /usr/include/stdlib.h
log.o: /usr/include/features.h /usr/include/sys/cdefs.h
log.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
log.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
log.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
log.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
log.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
log.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
log.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
log.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
log.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
log.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
log.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
log.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
log.o: /usr/include/getopt.h /usr/include/setjmp.h /usr/include/bits/setjmp.h
log.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
log.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
log.o: /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h
log.o: include/cdc_types.h include/regexp.h include/io.h include/net.h
log.o: include/ident.h include/object.h include/file.h
log.o: /usr/include/sys/stat.h /usr/include/bits/stat.h include/list.h
log.o: include/cdc_string.h include/buffer.h include/dict.h include/data.h
log.o: include/cdc_memory.h /usr/include/string.h include/log.h
log.o: include/parse.h include/cache.h include/util.h include/sig.h
net.o: include/defs.h include/config.h /usr/include/stdlib.h
net.o: /usr/include/features.h /usr/include/sys/cdefs.h
net.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
net.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
net.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
net.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
net.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
net.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
net.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
net.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
net.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
net.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
net.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
net.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
net.o: /usr/include/getopt.h /usr/include/setjmp.h /usr/include/bits/setjmp.h
net.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
net.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
net.o: /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h
net.o: include/cdc_types.h include/regexp.h include/io.h include/net.h
net.o: include/ident.h include/object.h include/file.h
net.o: /usr/include/sys/stat.h /usr/include/bits/stat.h include/list.h
net.o: include/cdc_string.h include/buffer.h include/dict.h include/data.h
net.o: include/cdc_memory.h /usr/include/string.h include/log.h
net.o: include/parse.h /usr/include/sys/param.h /usr/include/limits.h
net.o: /usr/include/bits/posix1_lim.h /usr/include/bits/local_lim.h
net.o: /usr/include/linux/limits.h /usr/include/bits/posix2_lim.h
net.o: /usr/include/linux/param.h /usr/include/asm/param.h
net.o: /usr/include/sys/socket.h /usr/include/sys/uio.h
net.o: /usr/include/bits/uio.h /usr/include/bits/socket.h
net.o: /usr/include/bits/sockaddr.h /usr/include/asm/socket.h
net.o: /usr/include/asm/sockios.h /usr/include/sys/time.h
net.o: /usr/include/sys/resource.h /usr/include/bits/resource.h
net.o: /usr/include/netinet/in.h /usr/include/stdint.h
net.o: /usr/include/bits/wchar.h /usr/include/bits/in.h
net.o: /usr/include/arpa/inet.h /usr/include/netdb.h /usr/include/rpc/netdb.h
net.o: /usr/include/bits/netdb.h /usr/include/ctype.h /usr/include/fcntl.h
net.o: /usr/include/bits/fcntl.h include/util.h
file.o: include/defs.h include/config.h /usr/include/stdlib.h
file.o: /usr/include/features.h /usr/include/sys/cdefs.h
file.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
file.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
file.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
file.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
file.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
file.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
file.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
file.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
file.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
file.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
file.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
file.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
file.o: /usr/include/getopt.h /usr/include/setjmp.h
file.o: /usr/include/bits/setjmp.h include/cdc_errs.h /usr/include/errno.h
file.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
file.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
file.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
file.o: include/regexp.h include/io.h include/net.h include/ident.h
file.o: include/object.h include/file.h /usr/include/sys/stat.h
file.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
file.o: include/buffer.h include/dict.h include/data.h include/cdc_memory.h
file.o: /usr/include/string.h include/log.h include/parse.h
file.o: /usr/include/ctype.h include/cdc_pcode.h include/grammar.h
file.o: include/token.h include/codegen.h include/code_prv.h
file.o: include/execute.h include/macros.h include/native.h include/util.h
file.o: include/opcodes.h include/decode.h include/cache.h
strutil.o: include/defs.h include/config.h /usr/include/stdlib.h
strutil.o: /usr/include/features.h /usr/include/sys/cdefs.h
strutil.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
strutil.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
strutil.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
strutil.o: /usr/include/time.h /usr/include/endian.h
strutil.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
strutil.o: /usr/include/sys/select.h /usr/include/bits/select.h
strutil.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
strutil.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
strutil.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
strutil.o: /usr/include/_G_config.h /usr/include/wchar.h
strutil.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
strutil.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
strutil.o: /usr/include/bits/confname.h /usr/include/getopt.h
strutil.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
strutil.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
strutil.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
strutil.o: /usr/include/asm-generic/errno.h
strutil.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
strutil.o: include/regexp.h include/io.h include/net.h include/ident.h
strutil.o: include/object.h include/file.h /usr/include/sys/stat.h
strutil.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
strutil.o: include/buffer.h include/dict.h include/data.h
strutil.o: include/cdc_memory.h /usr/include/string.h include/log.h
strutil.o: include/parse.h /usr/include/ctype.h include/strutil.h
strutil.o: include/util.h include/execute.h include/macros.h include/native.h
memory.o: include/defs.h include/config.h /usr/include/stdlib.h
memory.o: /usr/include/features.h /usr/include/sys/cdefs.h
memory.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
memory.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
memory.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
memory.o: /usr/include/time.h /usr/include/endian.h
memory.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
memory.o: /usr/include/sys/select.h /usr/include/bits/select.h
memory.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
memory.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
memory.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
memory.o: /usr/include/_G_config.h /usr/include/wchar.h
memory.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
memory.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
memory.o: /usr/include/bits/confname.h /usr/include/getopt.h
memory.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h include/cdc_errs.h
memory.o: /usr/include/errno.h /usr/include/bits/errno.h
memory.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
memory.o: /usr/include/asm-generic/errno.h
memory.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
memory.o: include/regexp.h include/io.h include/net.h include/ident.h
memory.o: include/object.h include/file.h /usr/include/sys/stat.h
memory.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
memory.o: include/buffer.h include/dict.h include/data.h include/cdc_memory.h
memory.o: /usr/include/string.h include/log.h include/parse.h
sig.o: include/defs.h include/config.h /usr/include/stdlib.h
sig.o: /usr/include/features.h /usr/include/sys/cdefs.h
sig.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
sig.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
sig.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
sig.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
sig.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
sig.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
sig.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
sig.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
sig.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
sig.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
sig.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
sig.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
sig.o: /usr/include/getopt.h /usr/include/setjmp.h /usr/include/bits/setjmp.h
sig.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
sig.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
sig.o: /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h
sig.o: include/cdc_types.h include/regexp.h include/io.h include/net.h
sig.o: include/ident.h include/object.h include/file.h
sig.o: /usr/include/sys/stat.h /usr/include/bits/stat.h include/list.h
sig.o: include/cdc_string.h include/buffer.h include/dict.h include/data.h
sig.o: include/cdc_memory.h /usr/include/string.h include/log.h
sig.o: include/parse.h /usr/include/signal.h /usr/include/bits/signum.h
sig.o: /usr/include/bits/siginfo.h /usr/include/bits/sigaction.h
sig.o: /usr/include/bits/sigcontext.h /usr/include/asm/sigcontext.h
sig.o: /usr/include/asm/types.h /usr/include/asm-generic/int-ll64.h
sig.o: /usr/include/bits/sigstack.h /usr/include/bits/sigthread.h
sig.o: /usr/include/sys/wait.h /usr/include/sys/resource.h
sig.o: /usr/include/bits/resource.h /usr/include/bits/waitflags.h
sig.o: /usr/include/bits/waitstatus.h include/execute.h include/macros.h
sig.o: include/native.h include/util.h include/sig.h
util.o: include/defs.h include/config.h /usr/include/stdlib.h
util.o: /usr/include/features.h /usr/include/sys/cdefs.h
util.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
util.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
util.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
util.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
util.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
util.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
util.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
util.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
util.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
util.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
util.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
util.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
util.o: /usr/include/getopt.h /usr/include/setjmp.h
util.o: /usr/include/bits/setjmp.h include/cdc_errs.h /usr/include/errno.h
util.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
util.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
util.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
util.o: include/regexp.h include/io.h include/net.h include/ident.h
util.o: include/object.h include/file.h /usr/include/sys/stat.h
util.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
util.o: include/buffer.h include/dict.h include/data.h include/cdc_memory.h
util.o: /usr/include/string.h include/log.h include/parse.h
util.o: /usr/include/ctype.h /usr/include/fcntl.h /usr/include/bits/fcntl.h
util.o: include/util.h include/token.h include/macros.h include/native.h
util.o: include/execute.h
regexp.o: include/defs.h include/config.h /usr/include/stdlib.h
regexp.o: /usr/include/features.h /usr/include/sys/cdefs.h
regexp.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
regexp.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
regexp.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
regexp.o: /usr/include/time.h /usr/include/endian.h
regexp.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
regexp.o: /usr/include/sys/select.h /usr/include/bits/select.h
regexp.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
regexp.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
regexp.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
regexp.o: /usr/include/_G_config.h /usr/include/wchar.h
regexp.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
regexp.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
regexp.o: /usr/include/bits/confname.h /usr/include/getopt.h
regexp.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h include/cdc_errs.h
regexp.o: /usr/include/errno.h /usr/include/bits/errno.h
regexp.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
regexp.o: /usr/include/asm-generic/errno.h
regexp.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
regexp.o: include/regexp.h include/io.h include/net.h include/ident.h
regexp.o: include/object.h include/file.h /usr/include/sys/stat.h
regexp.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
regexp.o: include/buffer.h include/dict.h include/data.h include/cdc_memory.h
regexp.o: /usr/include/string.h include/log.h include/parse.h include/util.h
defs.o: /usr/include/sys/types.h /usr/include/features.h
defs.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
defs.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
defs.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
defs.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
defs.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
defs.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
defs.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
defs.o: /usr/include/bits/pthreadtypes.h include/defs.h include/config.h
defs.o: /usr/include/stdlib.h /usr/include/alloca.h /usr/include/stdio.h
defs.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
defs.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
defs.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
defs.o: /usr/include/bits/confname.h /usr/include/getopt.h
defs.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h include/cdc_errs.h
defs.o: /usr/include/errno.h /usr/include/bits/errno.h
defs.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
defs.o: /usr/include/asm-generic/errno.h
defs.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
defs.o: include/regexp.h include/io.h include/net.h include/ident.h
defs.o: include/object.h include/file.h /usr/include/sys/stat.h
defs.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
defs.o: include/buffer.h include/dict.h include/data.h include/cdc_memory.h
defs.o: /usr/include/string.h include/log.h include/parse.h
dns.o: include/defs.h include/config.h /usr/include/stdlib.h
dns.o: /usr/include/features.h /usr/include/sys/cdefs.h
dns.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
dns.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
dns.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
dns.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
dns.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
dns.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
dns.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
dns.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
dns.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
dns.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
dns.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
dns.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
dns.o: /usr/include/getopt.h /usr/include/setjmp.h /usr/include/bits/setjmp.h
dns.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
dns.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
dns.o: /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h
dns.o: include/cdc_types.h include/regexp.h include/io.h include/net.h
dns.o: include/ident.h include/object.h include/file.h
dns.o: /usr/include/sys/stat.h /usr/include/bits/stat.h include/list.h
dns.o: include/cdc_string.h include/buffer.h include/dict.h include/data.h
dns.o: include/cdc_memory.h /usr/include/string.h include/log.h
dns.o: include/parse.h /usr/include/sys/socket.h /usr/include/sys/uio.h
dns.o: /usr/include/bits/uio.h /usr/include/bits/socket.h
dns.o: /usr/include/bits/sockaddr.h /usr/include/asm/socket.h
dns.o: /usr/include/asm/sockios.h /usr/include/netinet/in.h
dns.o: /usr/include/stdint.h /usr/include/bits/wchar.h /usr/include/bits/in.h
dns.o: /usr/include/arpa/inet.h /usr/include/netdb.h /usr/include/rpc/netdb.h
dns.o: /usr/include/bits/netdb.h /usr/include/ctype.h include/dns.h
codegen.o: include/defs.h include/config.h /usr/include/stdlib.h
codegen.o: /usr/include/features.h /usr/include/sys/cdefs.h
codegen.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
codegen.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
codegen.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
codegen.o: /usr/include/time.h /usr/include/endian.h
codegen.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
codegen.o: /usr/include/sys/select.h /usr/include/bits/select.h
codegen.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
codegen.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
codegen.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
codegen.o: /usr/include/_G_config.h /usr/include/wchar.h
codegen.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
codegen.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
codegen.o: /usr/include/bits/confname.h /usr/include/getopt.h
codegen.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
codegen.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
codegen.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
codegen.o: /usr/include/asm-generic/errno.h
codegen.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
codegen.o: include/regexp.h include/io.h include/net.h include/ident.h
codegen.o: include/object.h include/file.h /usr/include/sys/stat.h
codegen.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
codegen.o: include/buffer.h include/dict.h include/data.h
codegen.o: include/cdc_memory.h /usr/include/string.h include/log.h
codegen.o: include/parse.h include/cdc_pcode.h include/grammar.h
codegen.o: include/token.h include/codegen.h include/code_prv.h
codegen.o: include/execute.h include/macros.h include/native.h include/util.h
codegen.o: include/opcodes.h include/decode.h
execute.o: include/defs.h include/config.h /usr/include/stdlib.h
execute.o: /usr/include/features.h /usr/include/sys/cdefs.h
execute.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
execute.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
execute.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
execute.o: /usr/include/time.h /usr/include/endian.h
execute.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
execute.o: /usr/include/sys/select.h /usr/include/bits/select.h
execute.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
execute.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
execute.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
execute.o: /usr/include/_G_config.h /usr/include/wchar.h
execute.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
execute.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
execute.o: /usr/include/bits/confname.h /usr/include/getopt.h
execute.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
execute.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
execute.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
execute.o: /usr/include/asm-generic/errno.h
execute.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
execute.o: include/regexp.h include/io.h include/net.h include/ident.h
execute.o: include/object.h include/file.h /usr/include/sys/stat.h
execute.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
execute.o: include/buffer.h include/dict.h include/data.h
execute.o: include/cdc_memory.h /usr/include/string.h include/log.h
execute.o: include/parse.h /usr/include/ctype.h include/cdc_pcode.h
execute.o: include/grammar.h include/token.h include/codegen.h
execute.o: include/code_prv.h include/execute.h include/macros.h
execute.o: include/native.h include/util.h include/opcodes.h include/decode.h
execute.o: include/cache.h modules/moddef.h modules/cdc.h modules/web.h
execute.o: modules/ext_math.h
opcodes.o: include/defs.h include/config.h /usr/include/stdlib.h
opcodes.o: /usr/include/features.h /usr/include/sys/cdefs.h
opcodes.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
opcodes.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
opcodes.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
opcodes.o: /usr/include/time.h /usr/include/endian.h
opcodes.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
opcodes.o: /usr/include/sys/select.h /usr/include/bits/select.h
opcodes.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
opcodes.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
opcodes.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
opcodes.o: /usr/include/_G_config.h /usr/include/wchar.h
opcodes.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
opcodes.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
opcodes.o: /usr/include/bits/confname.h /usr/include/getopt.h
opcodes.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
opcodes.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
opcodes.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
opcodes.o: /usr/include/asm-generic/errno.h
opcodes.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
opcodes.o: include/regexp.h include/io.h include/net.h include/ident.h
opcodes.o: include/object.h include/file.h /usr/include/sys/stat.h
opcodes.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
opcodes.o: include/buffer.h include/dict.h include/data.h
opcodes.o: include/cdc_memory.h /usr/include/string.h include/log.h
opcodes.o: include/parse.h /usr/include/ctype.h include/cdc_pcode.h
opcodes.o: include/grammar.h include/token.h include/codegen.h
opcodes.o: include/code_prv.h include/execute.h include/macros.h
opcodes.o: include/native.h include/util.h include/opcodes.h include/decode.h
opcodes.o: include/operators.h include/functions.h
token.o: include/defs.h include/config.h /usr/include/stdlib.h
token.o: /usr/include/features.h /usr/include/sys/cdefs.h
token.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
token.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
token.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
token.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
token.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
token.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
token.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
token.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
token.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
token.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
token.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
token.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
token.o: /usr/include/getopt.h /usr/include/setjmp.h
token.o: /usr/include/bits/setjmp.h include/cdc_errs.h /usr/include/errno.h
token.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
token.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
token.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
token.o: include/regexp.h include/io.h include/net.h include/ident.h
token.o: include/object.h include/file.h /usr/include/sys/stat.h
token.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
token.o: include/buffer.h include/dict.h include/data.h include/cdc_memory.h
token.o: /usr/include/string.h include/log.h include/parse.h
token.o: /usr/include/ctype.h include/token.h
native.o: include/defs.h include/config.h /usr/include/stdlib.h
native.o: /usr/include/features.h /usr/include/sys/cdefs.h
native.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
native.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
native.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
native.o: /usr/include/time.h /usr/include/endian.h
native.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
native.o: /usr/include/sys/select.h /usr/include/bits/select.h
native.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
native.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
native.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
native.o: /usr/include/_G_config.h /usr/include/wchar.h
native.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
native.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
native.o: /usr/include/bits/confname.h /usr/include/getopt.h
native.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h include/cdc_errs.h
native.o: /usr/include/errno.h /usr/include/bits/errno.h
native.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
native.o: /usr/include/asm-generic/errno.h
native.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
native.o: include/regexp.h include/io.h include/net.h include/ident.h
native.o: include/object.h include/file.h /usr/include/sys/stat.h
native.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
native.o: include/buffer.h include/dict.h include/data.h include/cdc_memory.h
native.o: /usr/include/string.h include/log.h include/parse.h
native.o: include/cdc_pcode.h include/grammar.h include/token.h
native.o: include/codegen.h include/code_prv.h include/execute.h
native.o: include/macros.h include/native.h include/util.h include/opcodes.h
native.o: include/decode.h include/cdc_db.h include/cache.h
native.o: include/binarydb.h include/dbpack.h include/lookup.h
native.o: modules/moddef.h modules/cdc.h modules/web.h modules/ext_math.h
ops/operators.o: include/defs.h include/config.h /usr/include/stdlib.h
ops/operators.o: /usr/include/features.h /usr/include/sys/cdefs.h
ops/operators.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ops/operators.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
ops/operators.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ops/operators.o: /usr/include/time.h /usr/include/endian.h
ops/operators.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ops/operators.o: /usr/include/sys/select.h /usr/include/bits/select.h
ops/operators.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ops/operators.o: /usr/include/sys/sysmacros.h
ops/operators.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
ops/operators.o: /usr/include/stdio.h /usr/include/libio.h
ops/operators.o: /usr/include/_G_config.h /usr/include/wchar.h
ops/operators.o: /usr/include/bits/stdio_lim.h
ops/operators.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
ops/operators.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
ops/operators.o: /usr/include/getopt.h /usr/include/setjmp.h
ops/operators.o: /usr/include/bits/setjmp.h include/cdc_errs.h
ops/operators.o: /usr/include/errno.h /usr/include/bits/errno.h
ops/operators.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
ops/operators.o: /usr/include/asm-generic/errno.h
ops/operators.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
ops/operators.o: include/regexp.h include/io.h include/net.h include/ident.h
ops/operators.o: include/object.h include/file.h /usr/include/sys/stat.h
ops/operators.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
ops/operators.o: include/buffer.h include/dict.h include/data.h
ops/operators.o: include/cdc_memory.h /usr/include/string.h include/log.h
ops/operators.o: include/parse.h include/cdc_pcode.h include/grammar.h
ops/operators.o: include/token.h include/codegen.h include/code_prv.h
ops/operators.o: include/execute.h include/macros.h include/native.h
ops/operators.o: include/util.h include/opcodes.h include/decode.h
ops/operators.o: include/operators.h include/lookup.h include/handled_frob.h
ops/buffer.o: include/defs.h include/config.h /usr/include/stdlib.h
ops/buffer.o: /usr/include/features.h /usr/include/sys/cdefs.h
ops/buffer.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ops/buffer.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
ops/buffer.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ops/buffer.o: /usr/include/time.h /usr/include/endian.h
ops/buffer.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ops/buffer.o: /usr/include/sys/select.h /usr/include/bits/select.h
ops/buffer.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ops/buffer.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ops/buffer.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
ops/buffer.o: /usr/include/_G_config.h /usr/include/wchar.h
ops/buffer.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ops/buffer.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
ops/buffer.o: /usr/include/bits/confname.h /usr/include/getopt.h
ops/buffer.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
ops/buffer.o: include/cdc_errs.h /usr/include/errno.h
ops/buffer.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
ops/buffer.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
ops/buffer.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
ops/buffer.o: include/regexp.h include/io.h include/net.h include/ident.h
ops/buffer.o: include/object.h include/file.h /usr/include/sys/stat.h
ops/buffer.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
ops/buffer.o: include/buffer.h include/dict.h include/data.h
ops/buffer.o: include/cdc_memory.h /usr/include/string.h include/log.h
ops/buffer.o: include/parse.h include/cdc_pcode.h include/grammar.h
ops/buffer.o: include/token.h include/codegen.h include/code_prv.h
ops/buffer.o: include/execute.h include/macros.h include/native.h
ops/buffer.o: include/util.h include/opcodes.h include/decode.h
ops/error.o: include/defs.h include/config.h /usr/include/stdlib.h
ops/error.o: /usr/include/features.h /usr/include/sys/cdefs.h
ops/error.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ops/error.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
ops/error.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ops/error.o: /usr/include/time.h /usr/include/endian.h
ops/error.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ops/error.o: /usr/include/sys/select.h /usr/include/bits/select.h
ops/error.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ops/error.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ops/error.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
ops/error.o: /usr/include/_G_config.h /usr/include/wchar.h
ops/error.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ops/error.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
ops/error.o: /usr/include/bits/confname.h /usr/include/getopt.h
ops/error.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
ops/error.o: include/cdc_errs.h /usr/include/errno.h
ops/error.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
ops/error.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
ops/error.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
ops/error.o: include/regexp.h include/io.h include/net.h include/ident.h
ops/error.o: include/object.h include/file.h /usr/include/sys/stat.h
ops/error.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
ops/error.o: include/buffer.h include/dict.h include/data.h
ops/error.o: include/cdc_memory.h /usr/include/string.h include/log.h
ops/error.o: include/parse.h include/execute.h include/macros.h
ops/error.o: include/native.h include/util.h include/grammar.h
ops/error.o: include/cache.h include/opcodes.h
ops/list.o: include/defs.h include/config.h /usr/include/stdlib.h
ops/list.o: /usr/include/features.h /usr/include/sys/cdefs.h
ops/list.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ops/list.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
ops/list.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ops/list.o: /usr/include/time.h /usr/include/endian.h
ops/list.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ops/list.o: /usr/include/sys/select.h /usr/include/bits/select.h
ops/list.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ops/list.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ops/list.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
ops/list.o: /usr/include/_G_config.h /usr/include/wchar.h
ops/list.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ops/list.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
ops/list.o: /usr/include/bits/confname.h /usr/include/getopt.h
ops/list.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
ops/list.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
ops/list.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
ops/list.o: /usr/include/asm-generic/errno.h
ops/list.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
ops/list.o: include/regexp.h include/io.h include/net.h include/ident.h
ops/list.o: include/object.h include/file.h /usr/include/sys/stat.h
ops/list.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
ops/list.o: include/buffer.h include/dict.h include/data.h
ops/list.o: include/cdc_memory.h /usr/include/string.h include/log.h
ops/list.o: include/parse.h include/operators.h include/execute.h
ops/list.o: include/macros.h include/native.h include/util.h
ops/object.o: include/defs.h include/config.h /usr/include/stdlib.h
ops/object.o: /usr/include/features.h /usr/include/sys/cdefs.h
ops/object.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ops/object.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
ops/object.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ops/object.o: /usr/include/time.h /usr/include/endian.h
ops/object.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ops/object.o: /usr/include/sys/select.h /usr/include/bits/select.h
ops/object.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ops/object.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ops/object.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
ops/object.o: /usr/include/_G_config.h /usr/include/wchar.h
ops/object.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ops/object.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
ops/object.o: /usr/include/bits/confname.h /usr/include/getopt.h
ops/object.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
ops/object.o: include/cdc_errs.h /usr/include/errno.h
ops/object.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
ops/object.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
ops/object.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
ops/object.o: include/regexp.h include/io.h include/net.h include/ident.h
ops/object.o: include/object.h include/file.h /usr/include/sys/stat.h
ops/object.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
ops/object.o: include/buffer.h include/dict.h include/data.h
ops/object.o: include/cdc_memory.h /usr/include/string.h include/log.h
ops/object.o: include/parse.h include/cdc_pcode.h include/grammar.h
ops/object.o: include/token.h include/codegen.h include/code_prv.h
ops/object.o: include/execute.h include/macros.h include/native.h
ops/object.o: include/util.h include/opcodes.h include/decode.h
ops/object.o: include/cdc_db.h include/cache.h include/binarydb.h
ops/object.o: include/dbpack.h include/lookup.h
ops/dict.o: include/defs.h include/config.h /usr/include/stdlib.h
ops/dict.o: /usr/include/features.h /usr/include/sys/cdefs.h
ops/dict.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ops/dict.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
ops/dict.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ops/dict.o: /usr/include/time.h /usr/include/endian.h
ops/dict.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ops/dict.o: /usr/include/sys/select.h /usr/include/bits/select.h
ops/dict.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ops/dict.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ops/dict.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
ops/dict.o: /usr/include/_G_config.h /usr/include/wchar.h
ops/dict.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ops/dict.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
ops/dict.o: /usr/include/bits/confname.h /usr/include/getopt.h
ops/dict.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
ops/dict.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
ops/dict.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
ops/dict.o: /usr/include/asm-generic/errno.h
ops/dict.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
ops/dict.o: include/regexp.h include/io.h include/net.h include/ident.h
ops/dict.o: include/object.h include/file.h /usr/include/sys/stat.h
ops/dict.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
ops/dict.o: include/buffer.h include/dict.h include/data.h
ops/dict.o: include/cdc_memory.h /usr/include/string.h include/log.h
ops/dict.o: include/parse.h include/operators.h include/execute.h
ops/dict.o: include/macros.h include/native.h include/util.h
ops/string.o: include/defs.h include/config.h /usr/include/stdlib.h
ops/string.o: /usr/include/features.h /usr/include/sys/cdefs.h
ops/string.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ops/string.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
ops/string.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ops/string.o: /usr/include/time.h /usr/include/endian.h
ops/string.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ops/string.o: /usr/include/sys/select.h /usr/include/bits/select.h
ops/string.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ops/string.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ops/string.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
ops/string.o: /usr/include/_G_config.h /usr/include/wchar.h
ops/string.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ops/string.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
ops/string.o: /usr/include/bits/confname.h /usr/include/getopt.h
ops/string.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
ops/string.o: include/cdc_errs.h /usr/include/errno.h
ops/string.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
ops/string.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
ops/string.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
ops/string.o: include/regexp.h include/io.h include/net.h include/ident.h
ops/string.o: include/object.h include/file.h /usr/include/sys/stat.h
ops/string.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
ops/string.o: include/buffer.h include/dict.h include/data.h
ops/string.o: include/cdc_memory.h /usr/include/string.h include/log.h
ops/string.o: include/parse.h /usr/include/ctype.h include/operators.h
ops/string.o: include/execute.h include/macros.h include/native.h
ops/string.o: include/util.h include/strutil.h include/crypt.h
ops/data.o: include/defs.h include/config.h /usr/include/stdlib.h
ops/data.o: /usr/include/features.h /usr/include/sys/cdefs.h
ops/data.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ops/data.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
ops/data.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ops/data.o: /usr/include/time.h /usr/include/endian.h
ops/data.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ops/data.o: /usr/include/sys/select.h /usr/include/bits/select.h
ops/data.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ops/data.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ops/data.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
ops/data.o: /usr/include/_G_config.h /usr/include/wchar.h
ops/data.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ops/data.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
ops/data.o: /usr/include/bits/confname.h /usr/include/getopt.h
ops/data.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
ops/data.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
ops/data.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
ops/data.o: /usr/include/asm-generic/errno.h
ops/data.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
ops/data.o: include/regexp.h include/io.h include/net.h include/ident.h
ops/data.o: include/object.h include/file.h /usr/include/sys/stat.h
ops/data.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
ops/data.o: include/buffer.h include/dict.h include/data.h
ops/data.o: include/cdc_memory.h /usr/include/string.h include/log.h
ops/data.o: include/parse.h include/cdc_pcode.h include/grammar.h
ops/data.o: include/token.h include/codegen.h include/code_prv.h
ops/data.o: include/execute.h include/macros.h include/native.h
ops/data.o: include/util.h include/opcodes.h include/decode.h
ops/data.o: include/cdc_db.h include/cache.h include/binarydb.h
ops/data.o: include/dbpack.h include/lookup.h include/handled_frob.h
ops/sys.o: include/defs.h include/config.h /usr/include/stdlib.h
ops/sys.o: /usr/include/features.h /usr/include/sys/cdefs.h
ops/sys.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ops/sys.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
ops/sys.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ops/sys.o: /usr/include/time.h /usr/include/endian.h
ops/sys.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ops/sys.o: /usr/include/sys/select.h /usr/include/bits/select.h
ops/sys.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ops/sys.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ops/sys.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
ops/sys.o: /usr/include/_G_config.h /usr/include/wchar.h
ops/sys.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ops/sys.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
ops/sys.o: /usr/include/bits/confname.h /usr/include/getopt.h
ops/sys.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
ops/sys.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
ops/sys.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
ops/sys.o: /usr/include/asm-generic/errno.h
ops/sys.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
ops/sys.o: include/regexp.h include/io.h include/net.h include/ident.h
ops/sys.o: include/object.h include/file.h /usr/include/sys/stat.h
ops/sys.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
ops/sys.o: include/buffer.h include/dict.h include/data.h
ops/sys.o: include/cdc_memory.h /usr/include/string.h include/log.h
ops/sys.o: include/parse.h /usr/include/sys/param.h /usr/include/limits.h
ops/sys.o: /usr/include/bits/posix1_lim.h /usr/include/bits/local_lim.h
ops/sys.o: /usr/include/linux/limits.h /usr/include/bits/posix2_lim.h
ops/sys.o: /usr/include/linux/param.h /usr/include/asm/param.h
ops/sys.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h
ops/sys.o: /usr/include/dirent.h /usr/include/bits/dirent.h include/cache.h
ops/sys.o: include/execute.h include/macros.h include/native.h include/util.h
ops/sys.o: include/binarydb.h
ops/misc.o: include/defs.h include/config.h /usr/include/stdlib.h
ops/misc.o: /usr/include/features.h /usr/include/sys/cdefs.h
ops/misc.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ops/misc.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
ops/misc.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ops/misc.o: /usr/include/time.h /usr/include/endian.h
ops/misc.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ops/misc.o: /usr/include/sys/select.h /usr/include/bits/select.h
ops/misc.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ops/misc.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ops/misc.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
ops/misc.o: /usr/include/_G_config.h /usr/include/wchar.h
ops/misc.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ops/misc.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
ops/misc.o: /usr/include/bits/confname.h /usr/include/getopt.h
ops/misc.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
ops/misc.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
ops/misc.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
ops/misc.o: /usr/include/asm-generic/errno.h
ops/misc.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
ops/misc.o: include/regexp.h include/io.h include/net.h include/ident.h
ops/misc.o: include/object.h include/file.h /usr/include/sys/stat.h
ops/misc.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
ops/misc.o: include/buffer.h include/dict.h include/data.h
ops/misc.o: include/cdc_memory.h /usr/include/string.h include/log.h
ops/misc.o: include/parse.h /usr/include/sys/time.h include/operators.h
ops/misc.o: include/execute.h include/macros.h include/native.h
ops/misc.o: include/util.h include/opcodes.h
ops/task.o: include/defs.h include/config.h /usr/include/stdlib.h
ops/task.o: /usr/include/features.h /usr/include/sys/cdefs.h
ops/task.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ops/task.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
ops/task.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ops/task.o: /usr/include/time.h /usr/include/endian.h
ops/task.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ops/task.o: /usr/include/sys/select.h /usr/include/bits/select.h
ops/task.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ops/task.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ops/task.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
ops/task.o: /usr/include/_G_config.h /usr/include/wchar.h
ops/task.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ops/task.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
ops/task.o: /usr/include/bits/confname.h /usr/include/getopt.h
ops/task.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
ops/task.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
ops/task.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
ops/task.o: /usr/include/asm-generic/errno.h
ops/task.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
ops/task.o: include/regexp.h include/io.h include/net.h include/ident.h
ops/task.o: include/object.h include/file.h /usr/include/sys/stat.h
ops/task.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
ops/task.o: include/buffer.h include/dict.h include/data.h
ops/task.o: include/cdc_memory.h /usr/include/string.h include/log.h
ops/task.o: include/parse.h include/lookup.h include/execute.h
ops/task.o: include/macros.h include/native.h include/util.h
ops/task.o: include/grammar.h include/opcodes.h
ops/file.o: include/defs.h include/config.h /usr/include/stdlib.h
ops/file.o: /usr/include/features.h /usr/include/sys/cdefs.h
ops/file.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ops/file.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
ops/file.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ops/file.o: /usr/include/time.h /usr/include/endian.h
ops/file.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ops/file.o: /usr/include/sys/select.h /usr/include/bits/select.h
ops/file.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ops/file.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ops/file.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
ops/file.o: /usr/include/_G_config.h /usr/include/wchar.h
ops/file.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ops/file.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
ops/file.o: /usr/include/bits/confname.h /usr/include/getopt.h
ops/file.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
ops/file.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
ops/file.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
ops/file.o: /usr/include/asm-generic/errno.h
ops/file.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
ops/file.o: include/regexp.h include/io.h include/net.h include/ident.h
ops/file.o: include/object.h include/file.h /usr/include/sys/stat.h
ops/file.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
ops/file.o: include/buffer.h include/dict.h include/data.h
ops/file.o: include/cdc_memory.h /usr/include/string.h include/log.h
ops/file.o: include/parse.h /usr/include/limits.h
ops/file.o: /usr/include/bits/posix1_lim.h /usr/include/bits/local_lim.h
ops/file.o: /usr/include/linux/limits.h /usr/include/bits/posix2_lim.h
ops/file.o: /usr/include/sys/wait.h /usr/include/signal.h
ops/file.o: /usr/include/bits/signum.h /usr/include/bits/siginfo.h
ops/file.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ops/file.o: /usr/include/asm/sigcontext.h /usr/include/asm/types.h
ops/file.o: /usr/include/asm-generic/int-ll64.h /usr/include/bits/sigstack.h
ops/file.o: /usr/include/bits/sigthread.h /usr/include/sys/resource.h
ops/file.o: /usr/include/bits/resource.h /usr/include/bits/waitflags.h
ops/file.o: /usr/include/bits/waitstatus.h /usr/include/dirent.h
ops/file.o: /usr/include/bits/dirent.h /usr/include/fcntl.h
ops/file.o: /usr/include/bits/fcntl.h include/execute.h include/macros.h
ops/file.o: include/native.h include/util.h include/cache.h include/token.h
ops/network.o: include/defs.h include/config.h /usr/include/stdlib.h
ops/network.o: /usr/include/features.h /usr/include/sys/cdefs.h
ops/network.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ops/network.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
ops/network.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ops/network.o: /usr/include/time.h /usr/include/endian.h
ops/network.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ops/network.o: /usr/include/sys/select.h /usr/include/bits/select.h
ops/network.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ops/network.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ops/network.o: /usr/include/alloca.h /usr/include/stdio.h
ops/network.o: /usr/include/libio.h /usr/include/_G_config.h
ops/network.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
ops/network.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
ops/network.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
ops/network.o: /usr/include/getopt.h /usr/include/setjmp.h
ops/network.o: /usr/include/bits/setjmp.h include/cdc_errs.h
ops/network.o: /usr/include/errno.h /usr/include/bits/errno.h
ops/network.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
ops/network.o: /usr/include/asm-generic/errno.h
ops/network.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
ops/network.o: include/regexp.h include/io.h include/net.h include/ident.h
ops/network.o: include/object.h include/file.h /usr/include/sys/stat.h
ops/network.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
ops/network.o: include/buffer.h include/dict.h include/data.h
ops/network.o: include/cdc_memory.h /usr/include/string.h include/log.h
ops/network.o: include/parse.h include/execute.h include/macros.h
ops/network.o: include/native.h include/util.h include/cache.h
ops/math.o: include/defs.h include/config.h /usr/include/stdlib.h
ops/math.o: /usr/include/features.h /usr/include/sys/cdefs.h
ops/math.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ops/math.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
ops/math.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
ops/math.o: /usr/include/time.h /usr/include/endian.h
ops/math.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ops/math.o: /usr/include/sys/select.h /usr/include/bits/select.h
ops/math.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
ops/math.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
ops/math.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
ops/math.o: /usr/include/_G_config.h /usr/include/wchar.h
ops/math.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ops/math.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
ops/math.o: /usr/include/bits/confname.h /usr/include/getopt.h
ops/math.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
ops/math.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
ops/math.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
ops/math.o: /usr/include/asm-generic/errno.h
ops/math.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
ops/math.o: include/regexp.h include/io.h include/net.h include/ident.h
ops/math.o: include/object.h include/file.h /usr/include/sys/stat.h
ops/math.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
ops/math.o: include/buffer.h include/dict.h include/data.h
ops/math.o: include/cdc_memory.h /usr/include/string.h include/log.h
ops/math.o: include/parse.h /usr/include/math.h /usr/include/bits/huge_val.h
ops/math.o: /usr/include/bits/mathdef.h /usr/include/bits/mathcalls.h
ops/math.o: include/cdc_pcode.h include/grammar.h include/token.h
ops/math.o: include/codegen.h include/code_prv.h include/execute.h
ops/math.o: include/macros.h include/native.h include/util.h
ops/math.o: include/opcodes.h include/decode.h include/sig.h
modules/cdc.o: modules/cdc.h include/defs.h include/config.h
modules/cdc.o: /usr/include/stdlib.h /usr/include/features.h
modules/cdc.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
modules/cdc.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
modules/cdc.o: /usr/include/sys/types.h /usr/include/bits/types.h
modules/cdc.o: /usr/include/bits/typesizes.h /usr/include/time.h
modules/cdc.o: /usr/include/endian.h /usr/include/bits/endian.h
modules/cdc.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
modules/cdc.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
modules/cdc.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
modules/cdc.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
modules/cdc.o: /usr/include/stdio.h /usr/include/libio.h
modules/cdc.o: /usr/include/_G_config.h /usr/include/wchar.h
modules/cdc.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
modules/cdc.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
modules/cdc.o: /usr/include/bits/confname.h /usr/include/getopt.h
modules/cdc.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
modules/cdc.o: include/cdc_errs.h /usr/include/errno.h
modules/cdc.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
modules/cdc.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
modules/cdc.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
modules/cdc.o: include/regexp.h include/io.h include/net.h include/ident.h
modules/cdc.o: include/object.h include/file.h /usr/include/sys/stat.h
modules/cdc.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
modules/cdc.o: include/buffer.h include/dict.h include/data.h
modules/cdc.o: include/cdc_memory.h /usr/include/string.h include/log.h
modules/cdc.o: include/parse.h include/cdc_pcode.h include/grammar.h
modules/cdc.o: include/token.h include/codegen.h include/code_prv.h
modules/cdc.o: include/execute.h include/macros.h include/native.h
modules/cdc.o: include/util.h include/opcodes.h include/decode.h
modules/cdc_buffer.o: modules/cdc.h include/defs.h include/config.h
modules/cdc_buffer.o: /usr/include/stdlib.h /usr/include/features.h
modules/cdc_buffer.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
modules/cdc_buffer.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
modules/cdc_buffer.o: /usr/include/sys/types.h /usr/include/bits/types.h
modules/cdc_buffer.o: /usr/include/bits/typesizes.h /usr/include/time.h
modules/cdc_buffer.o: /usr/include/endian.h /usr/include/bits/endian.h
modules/cdc_buffer.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
modules/cdc_buffer.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
modules/cdc_buffer.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
modules/cdc_buffer.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
modules/cdc_buffer.o: /usr/include/stdio.h /usr/include/libio.h
modules/cdc_buffer.o: /usr/include/_G_config.h /usr/include/wchar.h
modules/cdc_buffer.o: /usr/include/bits/stdio_lim.h
modules/cdc_buffer.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
modules/cdc_buffer.o: /usr/include/bits/posix_opt.h
modules/cdc_buffer.o: /usr/include/bits/confname.h /usr/include/getopt.h
modules/cdc_buffer.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
modules/cdc_buffer.o: include/cdc_errs.h /usr/include/errno.h
modules/cdc_buffer.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
modules/cdc_buffer.o: /usr/include/asm/errno.h
modules/cdc_buffer.o: /usr/include/asm-generic/errno.h
modules/cdc_buffer.o: /usr/include/asm-generic/errno-base.h
modules/cdc_buffer.o: include/cdc_types.h include/regexp.h include/io.h
modules/cdc_buffer.o: include/net.h include/ident.h include/object.h
modules/cdc_buffer.o: include/file.h /usr/include/sys/stat.h
modules/cdc_buffer.o: /usr/include/bits/stat.h include/list.h
modules/cdc_buffer.o: include/cdc_string.h include/buffer.h include/dict.h
modules/cdc_buffer.o: include/data.h include/cdc_memory.h
modules/cdc_buffer.o: /usr/include/string.h include/log.h include/parse.h
modules/cdc_buffer.o: include/cdc_pcode.h include/grammar.h include/token.h
modules/cdc_buffer.o: include/codegen.h include/code_prv.h include/execute.h
modules/cdc_buffer.o: include/macros.h include/native.h include/util.h
modules/cdc_buffer.o: include/opcodes.h include/decode.h
modules/cdc_dict.o: modules/cdc.h include/defs.h include/config.h
modules/cdc_dict.o: /usr/include/stdlib.h /usr/include/features.h
modules/cdc_dict.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
modules/cdc_dict.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
modules/cdc_dict.o: /usr/include/sys/types.h /usr/include/bits/types.h
modules/cdc_dict.o: /usr/include/bits/typesizes.h /usr/include/time.h
modules/cdc_dict.o: /usr/include/endian.h /usr/include/bits/endian.h
modules/cdc_dict.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
modules/cdc_dict.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
modules/cdc_dict.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
modules/cdc_dict.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
modules/cdc_dict.o: /usr/include/stdio.h /usr/include/libio.h
modules/cdc_dict.o: /usr/include/_G_config.h /usr/include/wchar.h
modules/cdc_dict.o: /usr/include/bits/stdio_lim.h
modules/cdc_dict.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
modules/cdc_dict.o: /usr/include/bits/posix_opt.h
modules/cdc_dict.o: /usr/include/bits/confname.h /usr/include/getopt.h
modules/cdc_dict.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
modules/cdc_dict.o: include/cdc_errs.h /usr/include/errno.h
modules/cdc_dict.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
modules/cdc_dict.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
modules/cdc_dict.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
modules/cdc_dict.o: include/regexp.h include/io.h include/net.h
modules/cdc_dict.o: include/ident.h include/object.h include/file.h
modules/cdc_dict.o: /usr/include/sys/stat.h /usr/include/bits/stat.h
modules/cdc_dict.o: include/list.h include/cdc_string.h include/buffer.h
modules/cdc_dict.o: include/dict.h include/data.h include/cdc_memory.h
modules/cdc_dict.o: /usr/include/string.h include/log.h include/parse.h
modules/cdc_dict.o: include/cdc_pcode.h include/grammar.h include/token.h
modules/cdc_dict.o: include/codegen.h include/code_prv.h include/execute.h
modules/cdc_dict.o: include/macros.h include/native.h include/util.h
modules/cdc_dict.o: include/opcodes.h include/decode.h
modules/cdc_list.o: modules/cdc.h include/defs.h include/config.h
modules/cdc_list.o: /usr/include/stdlib.h /usr/include/features.h
modules/cdc_list.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
modules/cdc_list.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
modules/cdc_list.o: /usr/include/sys/types.h /usr/include/bits/types.h
modules/cdc_list.o: /usr/include/bits/typesizes.h /usr/include/time.h
modules/cdc_list.o: /usr/include/endian.h /usr/include/bits/endian.h
modules/cdc_list.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
modules/cdc_list.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
modules/cdc_list.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
modules/cdc_list.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
modules/cdc_list.o: /usr/include/stdio.h /usr/include/libio.h
modules/cdc_list.o: /usr/include/_G_config.h /usr/include/wchar.h
modules/cdc_list.o: /usr/include/bits/stdio_lim.h
modules/cdc_list.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
modules/cdc_list.o: /usr/include/bits/posix_opt.h
modules/cdc_list.o: /usr/include/bits/confname.h /usr/include/getopt.h
modules/cdc_list.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
modules/cdc_list.o: include/cdc_errs.h /usr/include/errno.h
modules/cdc_list.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
modules/cdc_list.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
modules/cdc_list.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
modules/cdc_list.o: include/regexp.h include/io.h include/net.h
modules/cdc_list.o: include/ident.h include/object.h include/file.h
modules/cdc_list.o: /usr/include/sys/stat.h /usr/include/bits/stat.h
modules/cdc_list.o: include/list.h include/cdc_string.h include/buffer.h
modules/cdc_list.o: include/dict.h include/data.h include/cdc_memory.h
modules/cdc_list.o: /usr/include/string.h include/log.h include/parse.h
modules/cdc_list.o: include/cdc_pcode.h include/grammar.h include/token.h
modules/cdc_list.o: include/codegen.h include/code_prv.h include/execute.h
modules/cdc_list.o: include/macros.h include/native.h include/util.h
modules/cdc_list.o: include/opcodes.h include/decode.h
modules/cdc_misc.o: modules/cdc.h include/defs.h include/config.h
modules/cdc_misc.o: /usr/include/stdlib.h /usr/include/features.h
modules/cdc_misc.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
modules/cdc_misc.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
modules/cdc_misc.o: /usr/include/sys/types.h /usr/include/bits/types.h
modules/cdc_misc.o: /usr/include/bits/typesizes.h /usr/include/time.h
modules/cdc_misc.o: /usr/include/endian.h /usr/include/bits/endian.h
modules/cdc_misc.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
modules/cdc_misc.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
modules/cdc_misc.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
modules/cdc_misc.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
modules/cdc_misc.o: /usr/include/stdio.h /usr/include/libio.h
modules/cdc_misc.o: /usr/include/_G_config.h /usr/include/wchar.h
modules/cdc_misc.o: /usr/include/bits/stdio_lim.h
modules/cdc_misc.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
modules/cdc_misc.o: /usr/include/bits/posix_opt.h
modules/cdc_misc.o: /usr/include/bits/confname.h /usr/include/getopt.h
modules/cdc_misc.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
modules/cdc_misc.o: include/cdc_errs.h /usr/include/errno.h
modules/cdc_misc.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
modules/cdc_misc.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
modules/cdc_misc.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
modules/cdc_misc.o: include/regexp.h include/io.h include/net.h
modules/cdc_misc.o: include/ident.h include/object.h include/file.h
modules/cdc_misc.o: /usr/include/sys/stat.h /usr/include/bits/stat.h
modules/cdc_misc.o: include/list.h include/cdc_string.h include/buffer.h
modules/cdc_misc.o: include/dict.h include/data.h include/cdc_memory.h
modules/cdc_misc.o: /usr/include/string.h include/log.h include/parse.h
modules/cdc_misc.o: include/cdc_pcode.h include/grammar.h include/token.h
modules/cdc_misc.o: include/codegen.h include/code_prv.h include/execute.h
modules/cdc_misc.o: include/macros.h include/native.h include/util.h
modules/cdc_misc.o: include/opcodes.h include/decode.h include/cdc_db.h
modules/cdc_misc.o: include/cache.h include/binarydb.h include/dbpack.h
modules/cdc_misc.o: include/lookup.h /usr/include/sys/time.h
modules/cdc_misc.o: /usr/include/sys/resource.h /usr/include/bits/resource.h
modules/cdc_misc.o: include/dns.h
modules/cdc_string.o: modules/cdc.h include/defs.h include/config.h
modules/cdc_string.o: /usr/include/stdlib.h /usr/include/features.h
modules/cdc_string.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
modules/cdc_string.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
modules/cdc_string.o: /usr/include/sys/types.h /usr/include/bits/types.h
modules/cdc_string.o: /usr/include/bits/typesizes.h /usr/include/time.h
modules/cdc_string.o: /usr/include/endian.h /usr/include/bits/endian.h
modules/cdc_string.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
modules/cdc_string.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
modules/cdc_string.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
modules/cdc_string.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
modules/cdc_string.o: /usr/include/stdio.h /usr/include/libio.h
modules/cdc_string.o: /usr/include/_G_config.h /usr/include/wchar.h
modules/cdc_string.o: /usr/include/bits/stdio_lim.h
modules/cdc_string.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
modules/cdc_string.o: /usr/include/bits/posix_opt.h
modules/cdc_string.o: /usr/include/bits/confname.h /usr/include/getopt.h
modules/cdc_string.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
modules/cdc_string.o: include/cdc_errs.h /usr/include/errno.h
modules/cdc_string.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
modules/cdc_string.o: /usr/include/asm/errno.h
modules/cdc_string.o: /usr/include/asm-generic/errno.h
modules/cdc_string.o: /usr/include/asm-generic/errno-base.h
modules/cdc_string.o: include/cdc_types.h include/regexp.h include/io.h
modules/cdc_string.o: include/net.h include/ident.h include/object.h
modules/cdc_string.o: include/file.h /usr/include/sys/stat.h
modules/cdc_string.o: /usr/include/bits/stat.h include/list.h
modules/cdc_string.o: include/cdc_string.h include/buffer.h include/dict.h
modules/cdc_string.o: include/data.h include/cdc_memory.h
modules/cdc_string.o: /usr/include/string.h include/log.h include/parse.h
modules/cdc_string.o: include/cdc_pcode.h include/grammar.h include/token.h
modules/cdc_string.o: include/codegen.h include/code_prv.h include/execute.h
modules/cdc_string.o: include/macros.h include/native.h include/util.h
modules/cdc_string.o: include/opcodes.h include/decode.h /usr/include/ctype.h
modules/cdc_string.o: include/strutil.h include/crypt.h
modules/cdc_integer.o: modules/cdc.h include/defs.h include/config.h
modules/cdc_integer.o: /usr/include/stdlib.h /usr/include/features.h
modules/cdc_integer.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
modules/cdc_integer.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
modules/cdc_integer.o: /usr/include/sys/types.h /usr/include/bits/types.h
modules/cdc_integer.o: /usr/include/bits/typesizes.h /usr/include/time.h
modules/cdc_integer.o: /usr/include/endian.h /usr/include/bits/endian.h
modules/cdc_integer.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
modules/cdc_integer.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
modules/cdc_integer.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
modules/cdc_integer.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
modules/cdc_integer.o: /usr/include/stdio.h /usr/include/libio.h
modules/cdc_integer.o: /usr/include/_G_config.h /usr/include/wchar.h
modules/cdc_integer.o: /usr/include/bits/stdio_lim.h
modules/cdc_integer.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
modules/cdc_integer.o: /usr/include/bits/posix_opt.h
modules/cdc_integer.o: /usr/include/bits/confname.h /usr/include/getopt.h
modules/cdc_integer.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
modules/cdc_integer.o: include/cdc_errs.h /usr/include/errno.h
modules/cdc_integer.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
modules/cdc_integer.o: /usr/include/asm/errno.h
modules/cdc_integer.o: /usr/include/asm-generic/errno.h
modules/cdc_integer.o: /usr/include/asm-generic/errno-base.h
modules/cdc_integer.o: include/cdc_types.h include/regexp.h include/io.h
modules/cdc_integer.o: include/net.h include/ident.h include/object.h
modules/cdc_integer.o: include/file.h /usr/include/sys/stat.h
modules/cdc_integer.o: /usr/include/bits/stat.h include/list.h
modules/cdc_integer.o: include/cdc_string.h include/buffer.h include/dict.h
modules/cdc_integer.o: include/data.h include/cdc_memory.h
modules/cdc_integer.o: /usr/include/string.h include/log.h include/parse.h
modules/cdc_integer.o: include/cdc_pcode.h include/grammar.h include/token.h
modules/cdc_integer.o: include/codegen.h include/code_prv.h include/execute.h
modules/cdc_integer.o: include/macros.h include/native.h include/util.h
modules/cdc_integer.o: include/opcodes.h include/decode.h
modules/web.o: modules/web.h include/defs.h include/config.h
modules/web.o: /usr/include/stdlib.h /usr/include/features.h
modules/web.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
modules/web.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
modules/web.o: /usr/include/sys/types.h /usr/include/bits/types.h
modules/web.o: /usr/include/bits/typesizes.h /usr/include/time.h
modules/web.o: /usr/include/endian.h /usr/include/bits/endian.h
modules/web.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
modules/web.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
modules/web.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
modules/web.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
modules/web.o: /usr/include/stdio.h /usr/include/libio.h
modules/web.o: /usr/include/_G_config.h /usr/include/wchar.h
modules/web.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
modules/web.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
modules/web.o: /usr/include/bits/confname.h /usr/include/getopt.h
modules/web.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
modules/web.o: include/cdc_errs.h /usr/include/errno.h
modules/web.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
modules/web.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
modules/web.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
modules/web.o: include/regexp.h include/io.h include/net.h include/ident.h
modules/web.o: include/object.h include/file.h /usr/include/sys/stat.h
modules/web.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
modules/web.o: include/buffer.h include/dict.h include/data.h
modules/web.o: include/cdc_memory.h /usr/include/string.h include/log.h
modules/web.o: include/parse.h include/cdc_pcode.h include/grammar.h
modules/web.o: include/token.h include/codegen.h include/code_prv.h
modules/web.o: include/execute.h include/macros.h include/native.h
modules/web.o: include/util.h include/opcodes.h include/decode.h
modules/ext_math.o: /usr/include/math.h /usr/include/features.h
modules/ext_math.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
modules/ext_math.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
modules/ext_math.o: /usr/include/bits/huge_val.h /usr/include/bits/mathdef.h
modules/ext_math.o: /usr/include/bits/mathcalls.h modules/ext_math.h
modules/ext_math.o: include/defs.h include/config.h /usr/include/stdlib.h
modules/ext_math.o: /usr/include/sys/types.h /usr/include/bits/types.h
modules/ext_math.o: /usr/include/bits/typesizes.h /usr/include/time.h
modules/ext_math.o: /usr/include/endian.h /usr/include/bits/endian.h
modules/ext_math.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
modules/ext_math.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
modules/ext_math.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
modules/ext_math.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
modules/ext_math.o: /usr/include/stdio.h /usr/include/libio.h
modules/ext_math.o: /usr/include/_G_config.h /usr/include/wchar.h
modules/ext_math.o: /usr/include/bits/stdio_lim.h
modules/ext_math.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
modules/ext_math.o: /usr/include/bits/posix_opt.h
modules/ext_math.o: /usr/include/bits/confname.h /usr/include/getopt.h
modules/ext_math.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
modules/ext_math.o: include/cdc_errs.h /usr/include/errno.h
modules/ext_math.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
modules/ext_math.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
modules/ext_math.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
modules/ext_math.o: include/regexp.h include/io.h include/net.h
modules/ext_math.o: include/ident.h include/object.h include/file.h
modules/ext_math.o: /usr/include/sys/stat.h /usr/include/bits/stat.h
modules/ext_math.o: include/list.h include/cdc_string.h include/buffer.h
modules/ext_math.o: include/dict.h include/data.h include/cdc_memory.h
modules/ext_math.o: /usr/include/string.h include/log.h include/parse.h
modules/ext_math.o: include/cdc_pcode.h include/grammar.h include/token.h
modules/ext_math.o: include/codegen.h include/code_prv.h include/execute.h
modules/ext_math.o: include/macros.h include/native.h include/util.h
modules/ext_math.o: include/opcodes.h include/decode.h
shs.o: include/defs.h include/config.h /usr/include/stdlib.h
shs.o: /usr/include/features.h /usr/include/sys/cdefs.h
shs.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
shs.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
shs.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
shs.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
shs.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
shs.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
shs.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
shs.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
shs.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
shs.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
shs.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
shs.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
shs.o: /usr/include/getopt.h /usr/include/setjmp.h /usr/include/bits/setjmp.h
shs.o: include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
shs.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
shs.o: /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h
shs.o: include/cdc_types.h include/regexp.h include/io.h include/net.h
shs.o: include/ident.h include/object.h include/file.h
shs.o: /usr/include/sys/stat.h /usr/include/bits/stat.h include/list.h
shs.o: include/cdc_string.h include/buffer.h include/dict.h include/data.h
shs.o: include/cdc_memory.h /usr/include/string.h include/log.h
shs.o: include/parse.h include/crypt.h
crypt.o: include/defs.h include/config.h /usr/include/stdlib.h
crypt.o: /usr/include/features.h /usr/include/sys/cdefs.h
crypt.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
crypt.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
crypt.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
crypt.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
crypt.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
crypt.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
crypt.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
crypt.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
crypt.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
crypt.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
crypt.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
crypt.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
crypt.o: /usr/include/getopt.h /usr/include/setjmp.h
crypt.o: /usr/include/bits/setjmp.h include/cdc_errs.h /usr/include/errno.h
crypt.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
crypt.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
crypt.o: /usr/include/asm-generic/errno-base.h include/cdc_types.h
crypt.o: include/regexp.h include/io.h include/net.h include/ident.h
crypt.o: include/object.h include/file.h /usr/include/sys/stat.h
crypt.o: /usr/include/bits/stat.h include/list.h include/cdc_string.h
crypt.o: include/buffer.h include/dict.h include/data.h include/cdc_memory.h
crypt.o: /usr/include/string.h include/log.h include/parse.h
crypt.o: /usr/include/ctype.h include/execute.h include/macros.h
crypt.o: include/native.h include/util.h include/crypt.h
