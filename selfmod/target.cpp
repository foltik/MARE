#include <unistd.h>
#include <sys/mman.h>
#include <stdio.h>

int test() {
    printf("Hello, world!\n");
    return 0;
}

int main(int argc, char **argv) {
    mprotect((void*)((unsigned long)test - ((unsigned long)test % getpagesize())),
             getpagesize(), PROT_READ | PROT_WRITE | PROT_EXEC);
    for (int i = 23; i --> 0;)
        *((char*)test + i) ^= argv[1][0];
    return test();
}
