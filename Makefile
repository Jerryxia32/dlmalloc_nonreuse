CC?=clang
CFLAGS=-Wall -Werror
CFLAGS+=-O0
CFLAGS+=-std=c11
CFLAGS+=-c
CFLAGS+=-g
CFLAGS+=-Wno-error=unused-function
CFLAGS+=-Wno-error=unused-variable
CFLAGS+=-Wno-error=unused-label

libdlmalloc_nonreuse.so: dlmalloc_nonreuse.c.o
	$(CC) -shared dlmalloc_nonreuse.c.o -o libdlmalloc_nonreuse.so

dlmalloc_nonreuse.c.o: dlmalloc_nonreuse.c dlmalloc_nonreuse.h
	$(CC) $(CFLAGS) -fPIC dlmalloc_nonreuse.c -o dlmalloc_nonreuse.c.o

clean:
	rm -f dlmalloc_nonreuse.c.o libdlmalloc_nonreuse.so
