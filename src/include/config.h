/* src/include/config.h.  Generated automatically by configure.  */
/* Full copyright information is available in the file ../doc/CREDITS */

#ifndef cdc_config_h
#define cdc_config_h

#define VERSION_MAJOR 1
#define VERSION_MINOR 1
#define VERSION_PATCH 12
#define VERSION_RELEASE "STABLE"

/* Define to empty if the keyword does not work.  */
/* #undef const */

/* Define if you don't have vprintf but do have _doprnt.  */
/* #undef HAVE_DOPRNT */

/* Define if you have the strftime function.  */
#define HAVE_STRFTIME 1

/* Define if you have <sys/wait.h> that is POSIX.1 compatible.  */
#define HAVE_SYS_WAIT_H 1

/* Define for the right header for dbm routines */
#define DBM_H_FILE <gdbm/ndbm.h>
#define DB_DBM_HSEARCH 1

/* Define if your struct dirent has d_namlen */
/* #undef HAVE_D_NAMLEN */

/* Define if your struct tm has tm_zone.  */
#define HAVE_TM_ZONE 1

/* Define if your struct tm has tm_gmtoff */
#define HAVE_TM_GMTOFF 1

/* Define if you don't have tm_zone but do have the external array
   tzname.  */
/* #undef HAVE_TZNAME */

/* Define if you have <vfork.h>.  */
/* #undef HAVE_VFORK_H */

/* Define if you have the vprintf function.  */
#define HAVE_VPRINTF 1

/* Define if you inet_aton() */
#define HAVE_INET_ATON 1

/* Define if you have rint() */
#define HAVE_RINT 1

/* Define as __inline if that's what the C compiler calls it.  */
/* #undef inline */

/* Define to `long' if <sys/types.h> doesn't define.  */
/* #undef off_t */

/* Define to `int' if <sys/types.h> doesn't define.  */
/* #undef pid_t */

/* Define as the return type of signal handlers (int or void).  */
#define RETSIGTYPE void

/* Define to `unsigned' if <sys/types.h> doesn't define.  */
/* #undef size_t */

/* Define if the `S_IS*' macros in <sys/stat.h> do not work properly.  */
/* #undef STAT_MACROS_BROKEN */

/* Define if you have the ANSI C header files.  */
#define STDC_HEADERS 1

/* Define if `sys_siglist' is declared by <signal.h>.  */
#define SYS_SIGLIST_DECLARED 1

/* Define if you can safely include both <sys/time.h> and <time.h>.  */
#define TIME_WITH_SYS_TIME 1

/* Define if your <sys/time.h> declares struct tm.  */
/* #undef TM_IN_SYS_TIME */

/* Define vfork as fork if vfork does not work.  */
/* #undef vfork */

/* byte order */
#define BYTEORDER 1234

/* Sizes */
#define SIZEOF_CHAR 1
#define SIZEOF_SHORT 2
#define SIZEOF_INT 4
#define SIZEOF_LONG 4
#define SIZEOF_LLONG 8
#define SIZEOF_FLOAT 4
#define SIZEOF_DOUBLE 8
#define SIZEOF_LDOUBLE 12

/* Define if you have the getrusage function.  */
#define HAVE_GETRUSAGE 1

/* Define if you have the gettimeofday function.  */
#define HAVE_GETTIMEOFDAY 1

/* Define if you have the memmove function.  */
#define HAVE_MEMMOVE 1

/* Define if you have the mkdir function.  */
#define HAVE_MKDIR 1

/* Define if you have the select function.  */
#define HAVE_SELECT 1

/* Define if you have the socket function.  */
#define HAVE_SOCKET 1

/* Define if you have the strchr function.  */
/* #undef HAVE_STRCHR */

/* Define if you have the strcspn function.  */
#define HAVE_STRCSPN 1

/* Define if you have the strerror function.  */
#define HAVE_STRERROR 1

/* Define if you have the strstr function.  */
#define HAVE_STRSTR 1

/* Define if you have the finite function.  */
#define HAVE_FINITE 1

/* Define if you have the <fcntl.h> header file.  */
#define HAVE_FCNTL_H 1

/* Define if you have the <sys/file.h> header file.  */
#define HAVE_SYS_FILE_H 1

/* Define if you have the <sys/time.h> header file.  */
#define HAVE_SYS_TIME_H 1

/* Define if you have the <unistd.h> header file.  */
#define HAVE_UNISTD_H 1

#define RESTRICTIVE_FILES 1

#define CACHE_WIDTH 61
#define CACHE_DEPTH 10

#define SYSTEM_TYPE "i686-pc-linux-gnu"

/* #undef USE_OS_CRYPT */

#ifndef __UNIX__
#  define __UNIX__
#endif

#define sys_gnu
#define vendor_linux
#define cpu_i686_pc
#define HOSTNAME lappy386
#endif
