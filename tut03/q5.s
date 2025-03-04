N_SIZE = 10
WORD_SIZE = 4

        .text
main:
        # $t0 -> int i;
        li      $t0, 0
cond:
        bge     $t0, N_SIZE, end

        # scanf("%d", &numbers[i]);
        li      $v0, 5
        syscall

        mul     $t1, $t0, WORD_SIZE
        sw      $v0, numbers($t1)

        # i++
        add     $t0, $t0, 1
        b       cond

end:

        li      $v0, 0
        jr      $ra

        .data
numbers:
        .space 4 * N_SIZE

