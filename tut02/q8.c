// Prints a right - angled triangle of asterisks, 10 rows high.

#include <stdio.h>

int main(void) {
    // for (int i = 1; i <= 10; i++) {
    //     for (int j = 0; j < i; j++) {
    //         printf("*");
    //     }
    //     printf("\n");
    // }
    int i, j;

outer_init:
    i = 1; // t0

outer_cond:
    if (i > 10) goto outer_end;

{
    inner_init:
        j = 0; // t1
    inner_cond:
        if (j >= i) goto inner_end;

        printf("*");
    
    inner_step:
        j++;
        goto inner_cond;
    
    inner_end:
        printf("\n");

}

outer_step:
    i++;
    goto outer_cond;

outer_end:
    return 0;
}
