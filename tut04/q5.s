        .text
main:
        begin
        push    $ra

        li   $a0, 3
        li   $a1, 4
        la   $a2, M
        li   $a3, 2
        jal  change

        # hard coded this offset
        # (2 * 2 + 2) * 4 => 24
        lw      $a0, 24 + M
        li      $v0, 1
        syscall


        li      $a0, '\n'
        li      $v0, 11
        syscall

        # expected 2 * 5 == 10
        pop     $ra
        end

        li      $v0, 0
        jr      $ra

change:
        li      $t0, 0
outer_cond:
        bge     $t0, $a0, outer_end

        li      $t1, 0
inner_cond:
        bge     $t1, $a0, inner_end

        mul     $t2, $t0, $a1   # (rows * ncols)
        add     $t2, $t2, $t1   # (rows * ncols) + cols
        mul     $t2, $t2, 4     # ((rows * ncols) + cols) * sizeof(int)

        add     $t2, $t2, $a2   # ptr = base_ptr + ((rows * ncols) + cols) * sizeof(int)

        # *tmp = *tmp * factor
        lw      $t3, ($t2)
        mul     $t3, $t3, $a3
        sw      $t3, ($t2)

        add     $t1, $t1, 1
        b       inner_cond
inner_end:

        add     $t0, $t0, 1
        b       outer_cond
outer_end:

        jr      $ra
        .data
M:
        .word 1, 2, 3, 4
        .word 3, 4, 5, 6
        .word 5, 6, 7, 8

