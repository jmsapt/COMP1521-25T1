// A simple program that will print 10 numbers from an array

#define N_SIZE 10

#include <stdio.h>

int numbers[N_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

int main(void) {
    int i;

    i = 0;
    while (i < N_SIZE) {
        printf("%d\n", numbers[i]);
        i++;
    }
}
