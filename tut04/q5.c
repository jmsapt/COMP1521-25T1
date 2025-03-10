/**
 * C function to multiply a matrix by a scalar.
 * 
 * nrows:  Number of rows in the matrix
 * ncols:  Number of columns in the matrix
 * M:      Matrix M
 * factor: Scalar factor to multiply by
 */
#include <stdio.h>
void change (int nrows, int ncols, int M[nrows][ncols], int factor)
{
    for (int row = 0; row < nrows; row++) {
        for (int col = 0; col < ncols; col++) {
            M[row][col] = factor * M[row][col];
        }
    }
}

// Additional code to get a runnable example
int arr[3][4] = {
    {1, 2, 3, 4},
    {3, 4, 5, 6},
    {5, 6, 7, 8},
};

int main(void) {
    change(3, 4, arr, 2);

    // for example, let's print the element M[2][2]
    printf("%d\n", arr[2][2]);

    return 0;
}
