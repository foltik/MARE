#include <stdio.h>

int data[0x10000] = {1};

void secret() {
    putchar('S');
    putchar('e');
    putchar('c');
    putchar('r');
    putchar('e');
    putchar('t');
    putchar('!');
    putchar('\n');
}

int main() {
    secret();
    return 0;
}
