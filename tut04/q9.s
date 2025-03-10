NULL = 0

        .text
main:
        la      $a0, list       # $a0 <- **List
        lw      $a0, ($a0)      # $a0 <- *List
        jal     max

        move    $a0, $v0
        li      $v0, 1
        syscall

        li      $v0, 11
        li      $a0, '\n'
        syscall

        li      $v0, 0
        jr      $ra

max:
        # TODO
        jr      $ra

        .data
list:   .word node1
node1:  .word 6, node2
node2:  .word 4, node3
node3:  .word 5, node4
node4:  .word 2, NULL
