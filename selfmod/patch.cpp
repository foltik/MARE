#include <unistd.h>
#include <sys/mman.h>

int test() {
    return 1 ? 1 : 0;
}

int main() {
    mprotect((void*)((unsigned long)test - ((unsigned long)test % getpagesize())),
             getpagesize(), PROT_READ | PROT_WRITE | PROT_EXEC);
    *((char*)test + 5) = 0;
    return test();
}
