CC?=clang
LD?=ld.lld
DEBUG?=1

CFLAGS=-Wall -Werror
LDFLAGS=
CFLAGS+=-std=c11
CFLAGS+=-c
CFLAGS+=-Wno-error=unused-function

ifeq ($(DEBUG),1)
CFLAGS+=-O0
CFLAGS+=-g
CFLAGS+=-DDEBUG=1 -DABORT_ON_ASSERT_FAILURE=1
else # DEBUG
CFLAGS+=-O3
CFLAGS+=-g0
CFLAGS+=-fomit-frame-pointer
CFLAGS+=-DINSECURE=1

ifneq (,$(findstring clang,$(CC)))
ifneq (,$(findstring lld,$(LD)))
# Use link-time optimizations if clang/lld.
CFLAGS+=-flto
LDFLAGS+=-O3
LDFLAGS+=--lto-O3
endif
endif

endif # DEBUG

ifeq ($(DEBUG),1)
libdlmalloc_nonreuse.so: dlmalloc_nonreuse.c.o
	$(LD) $(LDFLAGS) -shared $^ -o $@
else
libdlmalloc_nonreuse.so: dlmalloc_nonreuse.c.o
	$(LD) $(LDFLAGS) -shared $^ -o $@
	strip $@
endif

dlmalloc_nonreuse.c.o: dlmalloc_nonreuse.c dlmalloc_nonreuse.h
	$(CC) $(CFLAGS) -fPIC $< -o $@

clean:
	rm -f *.o *.so
