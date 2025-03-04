#include <stdio.h>

char *string = "hello world";

int main(void) {
    char *s = &string[0];
    int   length = 0;

    while (*s != '\0') {
        length++;  // increment length
        s++;       // move to next char
    }

    printf("%d\n", length);
    return 0;
}
