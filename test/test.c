#include <stdio.h>
#include <stdint.h>

uint64_t data[3] = {
    0xDEADBEEFCAFEBABE,
    0xDABADABADABAD000,
    0xFEEDC0DEFEEDFACE,
};

int main() {
    uint64_t offsets[2];

    for (int i = 0; i < 2; i++)
        offsets[i] = data[i + 1] - data[i];

    for (int i = 0; i < 2; i++)
        printf("%p\n", offsets[i]);
}
