#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    auto start = strtoul(argv[2], nullptr, 0);
    auto end = strtoul(argv[3], nullptr, 0);
    auto len = end - start;
    char key = argv[4][0];

    char* buf = new char[len];
    FILE *f = fopen(argv[1], "r+b");

    fseek(f, start, SEEK_SET);
    fread(buf, 1, len, f);

    for (int i = len; i --> 0;)
        buf[i] ^= key;

    fseek(f, start, SEEK_SET);
    fwrite(buf, 1, len, f);

    fclose(f);
}
