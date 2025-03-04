N_SIZE = 10
N_SIZE_M_1 = N_SIZE - 1
N_SIZE_D_2 = N_SIZE / 2
WORD_SIZE = 4

        .text
main:
        # $t0 -> int i;
        li      $t0, 0
cond:
        bge     $t0, N_SIZE_D_2, end



        # $t1 -> i * sizeof(int)
        # int x -> $t2 -> numbers[1]
        mul     $t1, $t0, WORD_SIZE
        lw      $t2, numbers($t1)

        # $t3 -> (N_SIZE_M_1 - i) * sizeof(int)
        # int y -> $t4 -> numbers[N_SIZE_M_1 - i]
        sub     $t3, N_SIZE_M_1, $t0
        mul     $t3, $t3, WORD_SIZE
        lw      $t4, numbers($t1)

        sw      $t4, numbers($t1)
        sw      $t2, numbers($t3)

        # i++
        add     $t0, $t0, 1
        b       cond

end:

        li      $v0, 0
        jr      $ra

        .data
numbers:
        .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
