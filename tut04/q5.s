        .text
main:
        li   $a0, 3
        li   $a1, 4
        la   $a2, M
        li   $a3, 2
        jal  change

        li      $v0, 0
        jr      $ra

change:
        # TODO
        jr      $ra
        .data
M:
        .word 1, 2, 3, 4
        .word 3, 4, 5, 6
        .word 5, 6, 7, 8

