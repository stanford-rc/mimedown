.POSIX:

OBJS = wrap.o smtp.o
CFLAGS = -std=c99 -g -pedantic -Wall -Wextra -Wshadow
LDLIBS = -lm
POSIX = -D_POSIX_C_SOURCE=200112L

.SUFFIXES :
.SUFFIXES : .o .c

include config.mk

md2mime : md2mime.c $(OBJS)
	$(CC) $(CFLAGS) $(POSIX) $(LDFLAGS) -o $@ md2mime.c $(OBJS) $(LDLIBS)

wrap.o : wrap.c wrap.h

smtp.o : smtp.c smtp.h

clean :
	rm -f md2mime *.o
