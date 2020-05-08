#include <unistd.h>
#include <stdio.h>
#include <sys/mman.h>

int test() {
    return 1 ? 1 : 0;
}

int main() {
    int r = mprotect((void*)((unsigned long)test - ((unsigned long)test % getpagesize())),
             getpagesize(), PROT_READ | PROT_WRITE | PROT_EXEC);
    if(r)
	    printf("Mprotect failed\n");
    *((char*)test + 5) = 0;
    return test();
}
