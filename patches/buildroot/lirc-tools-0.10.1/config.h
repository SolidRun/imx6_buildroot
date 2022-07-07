/* config.h.  Generated from config.h.in by configure.  */
/* config.h.in.  Generated from configure.ac by autoheader.  */


#ifndef ROOT_CONFIG_H
#define ROOT_CONFIG_H
#include     "paths.h"


/* type of argument 3 in getgrouplist() */
#define GETGROUPS_T gid_t

/* Define to 1 if `TIOCGWINSZ' requires <sys/ioctl.h>. */
#define GWINSZ_IN_SYS_IOCTL 1

/* Define to 1 if you have the <alsa/asoundlib.h> header file. */
#define HAVE_ALSA_ASOUNDLIB_H 1

/* Define if the ALSA library with SB RC support is installed */
#define HAVE_ALSA_SB_RC 1

/* Define to 1 if you have the `clock_gettime' function. */
#define HAVE_CLOCK_GETTIME 1

/* Define to 1 if you have the `daemon' function. */
#define HAVE_DAEMON 1

/* Define if the Linux input framwework is available */
/* #undef HAVE_DEVINPUT */

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H 1

/* Define to 1 if you have the <fcntl.h> header file. */
#define HAVE_FCNTL_H 1

/* Define if forkpty is available */
#define HAVE_FORKPTY 1

/* Define if the libftdi library is installed */
/* #undef HAVE_FTDI */

/* Define to 1 if you have the `gethostname' function. */
#define HAVE_GETHOSTNAME 1

/* Define to 1 if you have the `gettimeofday' function. */
#define HAVE_GETTIMEOFDAY 1

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define to 1 if you have the <IOKit/IOCFPlugIn.h> header file. */
/* #undef HAVE_IOKIT_IOCFPLUGIN_H */

/* define if kernel-headers contains lirc.h */
#define HAVE_KERNEL_LIRC_H 1

/* Define if the ALSA library is installed */
#define HAVE_LIBALSA 1

/* Define if the portaudio library is installed */
/* #undef HAVE_LIBPORTAUDIO */

/* Define to 1 if you have the <libudev.h> header file. */
/* #undef HAVE_LIBUDEV_H */

/* Define if libusb is installed */
/* #undef HAVE_LIBUSB */

/* Define to 1 if you have the <libusb-1.0/libusb.h> header file. */
/* #undef HAVE_LIBUSB_1_0_LIBUSB_H */

/* Define to 1 if you have the <libusb.h> header file. */
/* #undef HAVE_LIBUSB_H */

/* Define to 1 if you have the <libutil.h> header file. */
/* #undef HAVE_LIBUTIL_H */

/* Define to 1 if you have the <limits.h> header file. */
#define HAVE_LIMITS_H 1

/* defined if Linux input interface is available */
#define HAVE_LINUX_DEVINPUT 1

/* defined if Linux hiddev HIDDEV_FLAG_UREF flag is available */
#define HAVE_LINUX_HIDDEV_FLAG_UREF 1

/* Define to 1 if you have the <linux/hiddev.h> header file. */
#define HAVE_LINUX_HIDDEV_H 1

/* Define to 1 if you have the <linux/i2c-dev.h> header file. */
#define HAVE_LINUX_I2C_DEV_H 1

/* Define to 1 if you have the <linux/input.h> header file. */
#define HAVE_LINUX_INPUT_H 1

/* Define to 1 if you have the <linux/ioctl.h> header file. */
#define HAVE_LINUX_IOCTL_H 1

/* Define to 1 if you have the <linux/lirc.h> header file. */
#define HAVE_LINUX_LIRC_H 1

/* defined if linux/sched.h is available */
#define HAVE_LINUX_SCHED_H 1

/* Define to 1 if you have the <linux/types.h> header file. */
#define HAVE_LINUX_TYPES_H 1

/* Define to 1 if you have the <mach/mach_time.h> header file. */
/* #undef HAVE_MACH_MACH_TIME_H */

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the `mkfifo' function. */
#define HAVE_MKFIFO 1

/* defined if poll() is available and seemingly without bugs */
#define HAVE_POLL_FINE 1

/* defined if poll.h is available */
#define HAVE_POLL_H 1

/* defined if pty.h is available */
#define HAVE_PTY_H 1

/* defined if SCSI API is available */
#define HAVE_SCSI 1

/* Define to 1 if you have the <scsi/sg.h> header file. */
#define HAVE_SCSI_SG_H 1

/* defined if select(2) is available */
#define HAVE_SELECT 1

/* Define to 1 if you have the `snprintf' function. */
#define HAVE_SNPRINTF 1

/* Define to 1 if you have the `socket' function. */
#define HAVE_SOCKET 1

/* defined if soundcard API is available */
#define HAVE_SOUNDCARD 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the `strdup' function. */
#define HAVE_STRDUP 1

/* Define to 1 if you have the `strerror' function. */
#define HAVE_STRERROR 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the `strsep' function. */
#define HAVE_STRSEP 1

/* Define to 1 if you have the `strtoul' function. */
#define HAVE_STRTOUL 1

/* Define to 1 if you have the <syslog.h> header file. */
#define HAVE_SYSLOG_H 1

/* defined if systemd API is available */
/* #undef HAVE_SYSTEMD */

/* Define to 1 if you have the <sys/ioctl.h> header file. */
#define HAVE_SYS_IOCTL_H 1

/* defined if sys/poll.h is available */
#define HAVE_SYS_POLL_H 1

/* Define to 1 if you have the <sys/soundcard.h> header file. */
#define HAVE_SYS_SOUNDCARD_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/time.h> header file. */
#define HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to 1 if you have the <usb.h> header file. */
/* #undef HAVE_USB_H */

/* Define if util.h is installed */
/* #undef HAVE_UTIL_H */

/* Define to 1 if you have the `vsyslog' function. */
#define HAVE_VSYSLOG 1

/* Directory for device locks (usually /var/lock or /var/lock/lockdev) */
#define LIRC_LOCKDIR "/var/lock"

/* Environment variable overriding options file path */
#define LIRC_OPTIONS_VAR "LIRC_OPTIONS_PATH"

/* Define to the sub-directory where libtool stores uninstalled libraries. */
#define LT_OBJDIR ".libs/"

/* Name of package */
#define PACKAGE "lirc"

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT ""

/* Define to the full name of this package. */
#define PACKAGE_NAME "lirc"

/* Define to the full name and version of this package. */
#define PACKAGE_STRING "lirc 0.10.1"

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME "lirc"

/* Define to the home page for this package. */
#define PACKAGE_URL ""

/* Define to the version of this package. */
#define PACKAGE_VERSION "0.10.1"

/* Path to shell, usually /bin/sh or /usr/bin/sh */
#define SH_PATH "/usr/bin/sh"

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
#define TIME_WITH_SYS_TIME 1

/* Version number of package */
#define VERSION "0.10.1"

/* Numeric version, m.v.r => 10000 * m + 100 * v + r */
#define VERSION_NODOTS 1001

/* Define to 1 if the X Window System is missing or not being used. */
#define X_DISPLAY_MISSING 1

/* Define for Solaris 2.5.1 so the uint32_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. */
/* #undef _UINT32_T */

/* Define for Solaris 2.5.1 so the uint64_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. */
/* #undef _UINT64_T */

/* Define for Solaris 2.5.1 so the uint8_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. */
/* #undef _UINT8_T */

/* Define to `__inline__' or `__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
/* #undef inline */
#endif

/* Define to the type of a signed integer type of width exactly 16 bits if
   such a type exists and the standard includes do not define it. */
/* #undef int16_t */

/* Define to the type of a signed integer type of width exactly 32 bits if
   such a type exists and the standard includes do not define it. */
/* #undef int32_t */

/* Define to the type of a signed integer type of width exactly 64 bits if
   such a type exists and the standard includes do not define it. */
/* #undef int64_t */

/* Define to the type of a signed integer type of width exactly 8 bits if such
   a type exists and the standard includes do not define it. */
/* #undef int8_t */

/* Define to `int' if <sys/types.h> does not define. */
/* #undef pid_t */

/* Define to `unsigned int' if <sys/types.h> does not define. */
/* #undef size_t */

/* Define to the type of an unsigned integer type of width exactly 16 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint16_t */

/* Define to the type of an unsigned integer type of width exactly 32 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint32_t */

/* Define to the type of an unsigned integer type of width exactly 64 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint64_t */

/* Define to the type of an unsigned integer type of width exactly 8 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint8_t */


#include     "lirc/lirc_config.h"
#endif // ROOT_CONFIG_H

