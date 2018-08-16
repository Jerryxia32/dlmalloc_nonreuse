CC ?= cc

libdlmalloc_nonreuse.so: dlmalloc_nonreuse.c.o
	$(CC) -shared dlmalloc_nonreuse.c.o -o libdlmalloc_nonreuse.so

dlmalloc_nonreuse.c.o: dlmalloc_nonreuse.c dlmalloc_nonreuse.h
	$(CC) -Wall -Werror -Wno-error=expansion-to-defined -O3 -std=c11 -c -fPIC dlmalloc_nonreuse.c -o dlmalloc_nonreuse.c.o

clean:
	rm -f dlmalloc_nonreuse.c.o libdlmalloc_nonreuse.so
