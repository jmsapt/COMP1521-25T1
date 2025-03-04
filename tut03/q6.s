N_SIZE = 10
WORD_SIZE = 4

        .text
main:
        # $t0 -> int i;
        li      $t0, 0
cond:
        bge     $t0, N_SIZE, end

        # printf("%d\n", numbers[i]);
        mul     $t1, $t0, WORD_SIZE
        lw      $a0, numbers($t1)

        li      $v0, 1
        syscall

        li      $v0, 11
        li      $a0, '\n'
        syscall

        # i++
        add     $t0, $t0, 1
        b       cond

end:

        li      $v0, 0
        jr      $ra

        .data
numbers:
        .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

