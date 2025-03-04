#include <stdio.h>

int main(void) {
    int c;
    int count = 0;

    while ((c = getchar()) != EOF) {
        count++;
    }

    printf("Count was %d\n", count);

    return 0;
}
