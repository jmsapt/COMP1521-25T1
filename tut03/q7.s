N_SIZE = 10
WORD_SIZE = 4

        .text
main:
        # $t0 -> int i;
        li      $t0, 0
cond:
        bge     $t0, N_SIZE, end

        # $t1 -> i * sizeof(int)
        # $t2 -> numbers[1]
        mul     $t1, $t0, WORD_SIZE
        lw      $t2, numbers($t1)

        bgez    $t2, else
if:
        add     $t2, $t2, 42

        sw      $t2, numbers($t1)

        # printf
        move    $a0, $t2
        li      $v0, 1
        syscall

        li      $v0, 11
        li      $a0, '\n'
        syscall

else:

        # i++
        add     $t0, $t0, 1
        b       cond

end:

        li      $v0, 0
        jr      $ra

        .data
numbers:
        .word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9
