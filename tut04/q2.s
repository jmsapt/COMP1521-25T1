FLAG_ROWS = 6
FLAG_COLS = 12

        .text
main:

        # $t0 <- row
        li      $t0, 0
outter_cond:
        bge     $t0, FLAG_ROWS, outter_end

        # $t1 <- col
        li      $t1, 0
inner_cond:
        bge     $t1, FLAG_COLS, inner_end

        # $t2 <- offset
        mul     $t2, $t0, FLAG_COLS
        add     $t2, $t2, $t1
        mul     $t2, $t2, 1     # sizeof(char)

        # flag[rows][cols]
        lb      $a0, flag($t2)
        li      $v0, 11
        syscall

        add     $t1, $t1, 1
        b       inner_cond
inner_end:

        li      $a0, '\n'
        li      $v0, 11
        syscall

        add     $t0, $t0, 1
        b       outter_cond
outter_end:

        li      $v0, 0
        jr      $ra

        .data
flag:
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'

