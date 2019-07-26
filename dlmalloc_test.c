#include <stdio.h>
#include "dlmalloc_nonreuse.h"

int
main(int argc, char **argv)
{
	void *ptr1, *ptr2;
	printf("starting dlmalloctest\n");

	ptr1 = dlmalloc(1);
	ptr2 = dlmalloc(1);
	printf("ptr1 %#p\n", ptr1);
	printf("ptr2 %#p\n", ptr2);
	dlfree(ptr1);
	dlfree(ptr2);

	ptr1 = dlmalloc(128);
	ptr2 = dlmalloc(128);
	printf("ptr1 %#p\n", ptr1);
	printf("ptr2 %#p\n", ptr2);
	dlfree(ptr1);
	dlfree(ptr2);

	ptr1 = dlmalloc(4096);
	ptr2 = dlmalloc(4096);
	printf("ptr1 %#p\n", ptr1);
	printf("ptr2 %#p\n", ptr2);
	dlfree(ptr1);
	dlfree(ptr2);

	ptr1 = dlmalloc(1);
	ptr2 = dlmalloc(1);
	printf("ptr1 %#p\n", ptr1);
	printf("ptr2 %#p\n", ptr2);
	dlfree(ptr1);
	dlfree(ptr2);

	ptr1 = dlmalloc(128);
	ptr2 = dlmalloc(128);
	printf("ptr1 %#p\n", ptr1);
	printf("ptr2 %#p\n", ptr2);
	dlfree(ptr1);
	dlfree(ptr2);

	ptr1 = dlmalloc(4096);
	ptr2 = dlmalloc(4096);
	printf("ptr1 %#p\n", ptr1);
	printf("ptr2 %#p\n", ptr2);
	dlfree(ptr1);
	dlfree(ptr2);

	return (0);
}
