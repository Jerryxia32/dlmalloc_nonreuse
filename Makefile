CC?=clang
DEBUG?=0
CFLAGS=-Wall -Werror
CFLAGS+=-std=c11
CFLAGS+=-c
ifeq ($(DEBUG),1)
CFLAGS+=-O0
CFLAGS+=-g
CFLAGS+=-DDEBUG=1 -DABORT_ON_ASSERT_FAILURE=1
else
CFLAGS+=-O3
CFLAGS+=-g0
endif
CFLAGS+=-Wno-error=unused-function
CFLAGS+=-Wno-error=unused-variable

libdlmalloc_nonreuse.so: dlmalloc_nonreuse.c.o
	$(CC) -shared dlmalloc_nonreuse.c.o -o libdlmalloc_nonreuse.so

dlmalloc_nonreuse.c.o: dlmalloc_nonreuse.c dlmalloc_nonreuse.h
	$(CC) $(CFLAGS) -fPIC dlmalloc_nonreuse.c -o dlmalloc_nonreuse.c.o

clean:
	rm -f dlmalloc_nonreuse.c.o libdlmalloc_nonreuse.so
