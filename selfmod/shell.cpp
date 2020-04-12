#include <sys/mman.h>
#include <string.h>

char code[] = \
"\x48\x31\xc9\x48\xf7\xe1\x04\x3b\x48\xbb"
"\x2f\x62\x69\x6e\x2f\x2f\x73\x68\x52\x53"
"\x54\x5f\x52\x57\x54\x5e\x0f\x05";

int main() {
    size_t sz = sizeof(code);
    void *mem = mmap(nullptr, sz, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_PRIVATE | MAP_ANON, -1, 0);
    memcpy(mem, code, sz);
    ((void(*)())mem)();
}
