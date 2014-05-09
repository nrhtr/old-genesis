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

OBJS = operators.o buffer.o error.o list.o object.o dict.o string.o\
       data.o sys.o misc.o task.o file.o network.o math.o

SRCS = `echo $(OBJS) | sed -e 's/\.o/.c/g'`              

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

../include/parse.h:
	cd ../; make grammar.o include/parse.h

# DO NOT DELETE

operators.o: ../include/defs.h ../include/config.h /usr/include/stdlib.h
operators.o: /usr/include/features.h /usr/include/sys/cdefs.h
operators.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
operators.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
operators.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
operators.o: /usr/include/time.h /usr/include/endian.h
operators.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
operators.o: /usr/include/sys/select.h /usr/include/bits/select.h
operators.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
operators.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
operators.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
operators.o: /usr/include/_G_config.h /usr/include/wchar.h
operators.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
operators.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
operators.o: /usr/include/bits/confname.h /usr/include/getopt.h
operators.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
operators.o: ../include/cdc_errs.h /usr/include/errno.h
operators.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
operators.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
operators.o: /usr/include/asm-generic/errno-base.h ../include/cdc_types.h
operators.o: ../include/regexp.h ../include/io.h ../include/net.h
operators.o: ../include/ident.h ../include/object.h ../include/file.h
operators.o: /usr/include/sys/stat.h /usr/include/bits/stat.h
operators.o: ../include/list.h ../include/cdc_string.h ../include/buffer.h
operators.o: ../include/dict.h ../include/data.h ../include/cdc_memory.h
operators.o: /usr/include/string.h ../include/log.h ../include/parse.h
operators.o: ../include/cdc_pcode.h ../include/grammar.h ../include/token.h
operators.o: ../include/codegen.h ../include/code_prv.h ../include/execute.h
operators.o: ../include/macros.h ../include/native.h ../include/util.h
operators.o: ../include/opcodes.h ../include/decode.h ../include/operators.h
operators.o: ../include/lookup.h ../include/handled_frob.h
buffer.o: ../include/defs.h ../include/config.h /usr/include/stdlib.h
buffer.o: /usr/include/features.h /usr/include/sys/cdefs.h
buffer.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
buffer.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
buffer.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
buffer.o: /usr/include/time.h /usr/include/endian.h
buffer.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
buffer.o: /usr/include/sys/select.h /usr/include/bits/select.h
buffer.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
buffer.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
buffer.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
buffer.o: /usr/include/_G_config.h /usr/include/wchar.h
buffer.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
buffer.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
buffer.o: /usr/include/bits/confname.h /usr/include/getopt.h
buffer.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
buffer.o: ../include/cdc_errs.h /usr/include/errno.h
buffer.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
buffer.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
buffer.o: /usr/include/asm-generic/errno-base.h ../include/cdc_types.h
buffer.o: ../include/regexp.h ../include/io.h ../include/net.h
buffer.o: ../include/ident.h ../include/object.h ../include/file.h
buffer.o: /usr/include/sys/stat.h /usr/include/bits/stat.h ../include/list.h
buffer.o: ../include/cdc_string.h ../include/buffer.h ../include/dict.h
buffer.o: ../include/data.h ../include/cdc_memory.h /usr/include/string.h
buffer.o: ../include/log.h ../include/parse.h ../include/cdc_pcode.h
buffer.o: ../include/grammar.h ../include/token.h ../include/codegen.h
buffer.o: ../include/code_prv.h ../include/execute.h ../include/macros.h
buffer.o: ../include/native.h ../include/util.h ../include/opcodes.h
buffer.o: ../include/decode.h
error.o: ../include/defs.h ../include/config.h /usr/include/stdlib.h
error.o: /usr/include/features.h /usr/include/sys/cdefs.h
error.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
error.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
error.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
error.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
error.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
error.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
error.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
error.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
error.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
error.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
error.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
error.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
error.o: /usr/include/getopt.h /usr/include/setjmp.h
error.o: /usr/include/bits/setjmp.h ../include/cdc_errs.h
error.o: /usr/include/errno.h /usr/include/bits/errno.h
error.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
error.o: /usr/include/asm-generic/errno.h
error.o: /usr/include/asm-generic/errno-base.h ../include/cdc_types.h
error.o: ../include/regexp.h ../include/io.h ../include/net.h
error.o: ../include/ident.h ../include/object.h ../include/file.h
error.o: /usr/include/sys/stat.h /usr/include/bits/stat.h ../include/list.h
error.o: ../include/cdc_string.h ../include/buffer.h ../include/dict.h
error.o: ../include/data.h ../include/cdc_memory.h /usr/include/string.h
error.o: ../include/log.h ../include/parse.h ../include/execute.h
error.o: ../include/macros.h ../include/native.h ../include/util.h
error.o: ../include/grammar.h ../include/cache.h ../include/opcodes.h
list.o: ../include/defs.h ../include/config.h /usr/include/stdlib.h
list.o: /usr/include/features.h /usr/include/sys/cdefs.h
list.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
list.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
list.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
list.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
list.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
list.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
list.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
list.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
list.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
list.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
list.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
list.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
list.o: /usr/include/getopt.h /usr/include/setjmp.h
list.o: /usr/include/bits/setjmp.h ../include/cdc_errs.h /usr/include/errno.h
list.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
list.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
list.o: /usr/include/asm-generic/errno-base.h ../include/cdc_types.h
list.o: ../include/regexp.h ../include/io.h ../include/net.h
list.o: ../include/ident.h ../include/object.h ../include/file.h
list.o: /usr/include/sys/stat.h /usr/include/bits/stat.h ../include/list.h
list.o: ../include/cdc_string.h ../include/buffer.h ../include/dict.h
list.o: ../include/data.h ../include/cdc_memory.h /usr/include/string.h
list.o: ../include/log.h ../include/parse.h ../include/operators.h
list.o: ../include/execute.h ../include/macros.h ../include/native.h
list.o: ../include/util.h
object.o: ../include/defs.h ../include/config.h /usr/include/stdlib.h
object.o: /usr/include/features.h /usr/include/sys/cdefs.h
object.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
object.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
object.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
object.o: /usr/include/time.h /usr/include/endian.h
object.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
object.o: /usr/include/sys/select.h /usr/include/bits/select.h
object.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
object.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
object.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
object.o: /usr/include/_G_config.h /usr/include/wchar.h
object.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
object.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
object.o: /usr/include/bits/confname.h /usr/include/getopt.h
object.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
object.o: ../include/cdc_errs.h /usr/include/errno.h
object.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
object.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
object.o: /usr/include/asm-generic/errno-base.h ../include/cdc_types.h
object.o: ../include/regexp.h ../include/io.h ../include/net.h
object.o: ../include/ident.h ../include/object.h ../include/file.h
object.o: /usr/include/sys/stat.h /usr/include/bits/stat.h ../include/list.h
object.o: ../include/cdc_string.h ../include/buffer.h ../include/dict.h
object.o: ../include/data.h ../include/cdc_memory.h /usr/include/string.h
object.o: ../include/log.h ../include/parse.h ../include/cdc_pcode.h
object.o: ../include/grammar.h ../include/token.h ../include/codegen.h
object.o: ../include/code_prv.h ../include/execute.h ../include/macros.h
object.o: ../include/native.h ../include/util.h ../include/opcodes.h
object.o: ../include/decode.h ../include/cdc_db.h ../include/cache.h
object.o: ../include/binarydb.h ../include/dbpack.h ../include/lookup.h
dict.o: ../include/defs.h ../include/config.h /usr/include/stdlib.h
dict.o: /usr/include/features.h /usr/include/sys/cdefs.h
dict.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
dict.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
dict.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
dict.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
dict.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
dict.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
dict.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
dict.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
dict.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
dict.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
dict.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
dict.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
dict.o: /usr/include/getopt.h /usr/include/setjmp.h
dict.o: /usr/include/bits/setjmp.h ../include/cdc_errs.h /usr/include/errno.h
dict.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
dict.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
dict.o: /usr/include/asm-generic/errno-base.h ../include/cdc_types.h
dict.o: ../include/regexp.h ../include/io.h ../include/net.h
dict.o: ../include/ident.h ../include/object.h ../include/file.h
dict.o: /usr/include/sys/stat.h /usr/include/bits/stat.h ../include/list.h
dict.o: ../include/cdc_string.h ../include/buffer.h ../include/dict.h
dict.o: ../include/data.h ../include/cdc_memory.h /usr/include/string.h
dict.o: ../include/log.h ../include/parse.h ../include/operators.h
dict.o: ../include/execute.h ../include/macros.h ../include/native.h
dict.o: ../include/util.h
string.o: ../include/defs.h ../include/config.h /usr/include/stdlib.h
string.o: /usr/include/features.h /usr/include/sys/cdefs.h
string.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
string.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
string.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
string.o: /usr/include/time.h /usr/include/endian.h
string.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
string.o: /usr/include/sys/select.h /usr/include/bits/select.h
string.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
string.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
string.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
string.o: /usr/include/_G_config.h /usr/include/wchar.h
string.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
string.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
string.o: /usr/include/bits/confname.h /usr/include/getopt.h
string.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
string.o: ../include/cdc_errs.h /usr/include/errno.h
string.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
string.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
string.o: /usr/include/asm-generic/errno-base.h ../include/cdc_types.h
string.o: ../include/regexp.h ../include/io.h ../include/net.h
string.o: ../include/ident.h ../include/object.h ../include/file.h
string.o: /usr/include/sys/stat.h /usr/include/bits/stat.h ../include/list.h
string.o: ../include/cdc_string.h ../include/buffer.h ../include/dict.h
string.o: ../include/data.h ../include/cdc_memory.h /usr/include/string.h
string.o: ../include/log.h ../include/parse.h /usr/include/ctype.h
string.o: ../include/operators.h ../include/execute.h ../include/macros.h
string.o: ../include/native.h ../include/util.h ../include/strutil.h
string.o: ../include/crypt.h
data.o: ../include/defs.h ../include/config.h /usr/include/stdlib.h
data.o: /usr/include/features.h /usr/include/sys/cdefs.h
data.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
data.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
data.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
data.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
data.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
data.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
data.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
data.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
data.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
data.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
data.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
data.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
data.o: /usr/include/getopt.h /usr/include/setjmp.h
data.o: /usr/include/bits/setjmp.h ../include/cdc_errs.h /usr/include/errno.h
data.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
data.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
data.o: /usr/include/asm-generic/errno-base.h ../include/cdc_types.h
data.o: ../include/regexp.h ../include/io.h ../include/net.h
data.o: ../include/ident.h ../include/object.h ../include/file.h
data.o: /usr/include/sys/stat.h /usr/include/bits/stat.h ../include/list.h
data.o: ../include/cdc_string.h ../include/buffer.h ../include/dict.h
data.o: ../include/data.h ../include/cdc_memory.h /usr/include/string.h
data.o: ../include/log.h ../include/parse.h ../include/cdc_pcode.h
data.o: ../include/grammar.h ../include/token.h ../include/codegen.h
data.o: ../include/code_prv.h ../include/execute.h ../include/macros.h
data.o: ../include/native.h ../include/util.h ../include/opcodes.h
data.o: ../include/decode.h ../include/cdc_db.h ../include/cache.h
data.o: ../include/binarydb.h ../include/dbpack.h ../include/lookup.h
data.o: ../include/handled_frob.h
sys.o: ../include/defs.h ../include/config.h /usr/include/stdlib.h
sys.o: /usr/include/features.h /usr/include/sys/cdefs.h
sys.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
sys.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
sys.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
sys.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
sys.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
sys.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
sys.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
sys.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
sys.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
sys.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
sys.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
sys.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
sys.o: /usr/include/getopt.h /usr/include/setjmp.h /usr/include/bits/setjmp.h
sys.o: ../include/cdc_errs.h /usr/include/errno.h /usr/include/bits/errno.h
sys.o: /usr/include/linux/errno.h /usr/include/asm/errno.h
sys.o: /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h
sys.o: ../include/cdc_types.h ../include/regexp.h ../include/io.h
sys.o: ../include/net.h ../include/ident.h ../include/object.h
sys.o: ../include/file.h /usr/include/sys/stat.h /usr/include/bits/stat.h
sys.o: ../include/list.h ../include/cdc_string.h ../include/buffer.h
sys.o: ../include/dict.h ../include/data.h ../include/cdc_memory.h
sys.o: /usr/include/string.h ../include/log.h ../include/parse.h
sys.o: /usr/include/sys/param.h /usr/include/limits.h
sys.o: /usr/include/bits/posix1_lim.h /usr/include/bits/local_lim.h
sys.o: /usr/include/linux/limits.h /usr/include/bits/posix2_lim.h
sys.o: /usr/include/linux/param.h /usr/include/asm/param.h
sys.o: /usr/include/fcntl.h /usr/include/bits/fcntl.h /usr/include/dirent.h
sys.o: /usr/include/bits/dirent.h ../include/cache.h ../include/execute.h
sys.o: ../include/macros.h ../include/native.h ../include/util.h
sys.o: ../include/binarydb.h
misc.o: ../include/defs.h ../include/config.h /usr/include/stdlib.h
misc.o: /usr/include/features.h /usr/include/sys/cdefs.h
misc.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
misc.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
misc.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
misc.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
misc.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
misc.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
misc.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
misc.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
misc.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
misc.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
misc.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
misc.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
misc.o: /usr/include/getopt.h /usr/include/setjmp.h
misc.o: /usr/include/bits/setjmp.h ../include/cdc_errs.h /usr/include/errno.h
misc.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
misc.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
misc.o: /usr/include/asm-generic/errno-base.h ../include/cdc_types.h
misc.o: ../include/regexp.h ../include/io.h ../include/net.h
misc.o: ../include/ident.h ../include/object.h ../include/file.h
misc.o: /usr/include/sys/stat.h /usr/include/bits/stat.h ../include/list.h
misc.o: ../include/cdc_string.h ../include/buffer.h ../include/dict.h
misc.o: ../include/data.h ../include/cdc_memory.h /usr/include/string.h
misc.o: ../include/log.h ../include/parse.h /usr/include/sys/time.h
misc.o: ../include/operators.h ../include/execute.h ../include/macros.h
misc.o: ../include/native.h ../include/util.h ../include/opcodes.h
task.o: ../include/defs.h ../include/config.h /usr/include/stdlib.h
task.o: /usr/include/features.h /usr/include/sys/cdefs.h
task.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
task.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
task.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
task.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
task.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
task.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
task.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
task.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
task.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
task.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
task.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
task.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
task.o: /usr/include/getopt.h /usr/include/setjmp.h
task.o: /usr/include/bits/setjmp.h ../include/cdc_errs.h /usr/include/errno.h
task.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
task.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
task.o: /usr/include/asm-generic/errno-base.h ../include/cdc_types.h
task.o: ../include/regexp.h ../include/io.h ../include/net.h
task.o: ../include/ident.h ../include/object.h ../include/file.h
task.o: /usr/include/sys/stat.h /usr/include/bits/stat.h ../include/list.h
task.o: ../include/cdc_string.h ../include/buffer.h ../include/dict.h
task.o: ../include/data.h ../include/cdc_memory.h /usr/include/string.h
task.o: ../include/log.h ../include/parse.h ../include/lookup.h
task.o: ../include/execute.h ../include/macros.h ../include/native.h
task.o: ../include/util.h ../include/grammar.h ../include/opcodes.h
file.o: ../include/defs.h ../include/config.h /usr/include/stdlib.h
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
file.o: /usr/include/bits/setjmp.h ../include/cdc_errs.h /usr/include/errno.h
file.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
file.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
file.o: /usr/include/asm-generic/errno-base.h ../include/cdc_types.h
file.o: ../include/regexp.h ../include/io.h ../include/net.h
file.o: ../include/ident.h ../include/object.h ../include/file.h
file.o: /usr/include/sys/stat.h /usr/include/bits/stat.h ../include/list.h
file.o: ../include/cdc_string.h ../include/buffer.h ../include/dict.h
file.o: ../include/data.h ../include/cdc_memory.h /usr/include/string.h
file.o: ../include/log.h ../include/parse.h /usr/include/limits.h
file.o: /usr/include/bits/posix1_lim.h /usr/include/bits/local_lim.h
file.o: /usr/include/linux/limits.h /usr/include/bits/posix2_lim.h
file.o: /usr/include/sys/wait.h /usr/include/signal.h
file.o: /usr/include/bits/signum.h /usr/include/bits/siginfo.h
file.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
file.o: /usr/include/asm/sigcontext.h /usr/include/asm/types.h
file.o: /usr/include/asm-generic/int-ll64.h /usr/include/bits/sigstack.h
file.o: /usr/include/bits/sigthread.h /usr/include/sys/resource.h
file.o: /usr/include/bits/resource.h /usr/include/bits/waitflags.h
file.o: /usr/include/bits/waitstatus.h /usr/include/dirent.h
file.o: /usr/include/bits/dirent.h /usr/include/fcntl.h
file.o: /usr/include/bits/fcntl.h ../include/execute.h ../include/macros.h
file.o: ../include/native.h ../include/util.h ../include/cache.h
file.o: ../include/token.h
network.o: ../include/defs.h ../include/config.h /usr/include/stdlib.h
network.o: /usr/include/features.h /usr/include/sys/cdefs.h
network.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
network.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
network.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
network.o: /usr/include/time.h /usr/include/endian.h
network.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
network.o: /usr/include/sys/select.h /usr/include/bits/select.h
network.o: /usr/include/bits/sigset.h /usr/include/bits/time.h
network.o: /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h
network.o: /usr/include/alloca.h /usr/include/stdio.h /usr/include/libio.h
network.o: /usr/include/_G_config.h /usr/include/wchar.h
network.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
network.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
network.o: /usr/include/bits/confname.h /usr/include/getopt.h
network.o: /usr/include/setjmp.h /usr/include/bits/setjmp.h
network.o: ../include/cdc_errs.h /usr/include/errno.h
network.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
network.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
network.o: /usr/include/asm-generic/errno-base.h ../include/cdc_types.h
network.o: ../include/regexp.h ../include/io.h ../include/net.h
network.o: ../include/ident.h ../include/object.h ../include/file.h
network.o: /usr/include/sys/stat.h /usr/include/bits/stat.h ../include/list.h
network.o: ../include/cdc_string.h ../include/buffer.h ../include/dict.h
network.o: ../include/data.h ../include/cdc_memory.h /usr/include/string.h
network.o: ../include/log.h ../include/parse.h ../include/execute.h
network.o: ../include/macros.h ../include/native.h ../include/util.h
network.o: ../include/cache.h
math.o: ../include/defs.h ../include/config.h /usr/include/stdlib.h
math.o: /usr/include/features.h /usr/include/sys/cdefs.h
math.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
math.o: /usr/include/gnu/stubs-32.h /usr/include/sys/types.h
math.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
math.o: /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h
math.o: /usr/include/bits/byteswap.h /usr/include/sys/select.h
math.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
math.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
math.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
math.o: /usr/include/stdio.h /usr/include/libio.h /usr/include/_G_config.h
math.o: /usr/include/wchar.h /usr/include/bits/stdio_lim.h
math.o: /usr/include/bits/sys_errlist.h /usr/include/unistd.h
math.o: /usr/include/bits/posix_opt.h /usr/include/bits/confname.h
math.o: /usr/include/getopt.h /usr/include/setjmp.h
math.o: /usr/include/bits/setjmp.h ../include/cdc_errs.h /usr/include/errno.h
math.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
math.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
math.o: /usr/include/asm-generic/errno-base.h ../include/cdc_types.h
math.o: ../include/regexp.h ../include/io.h ../include/net.h
math.o: ../include/ident.h ../include/object.h ../include/file.h
math.o: /usr/include/sys/stat.h /usr/include/bits/stat.h ../include/list.h
math.o: ../include/cdc_string.h ../include/buffer.h ../include/dict.h
math.o: ../include/data.h ../include/cdc_memory.h /usr/include/string.h
math.o: ../include/log.h ../include/parse.h /usr/include/math.h
math.o: /usr/include/bits/huge_val.h /usr/include/bits/mathdef.h
math.o: /usr/include/bits/mathcalls.h ../include/cdc_pcode.h
math.o: ../include/grammar.h ../include/token.h ../include/codegen.h
math.o: ../include/code_prv.h ../include/execute.h ../include/macros.h
math.o: ../include/native.h ../include/util.h ../include/opcodes.h
math.o: ../include/decode.h ../include/sig.h
