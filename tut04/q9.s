NULL = 0
NODE_OFFSET_VALUE = 0
NODE_OFFSET_NEXT = 4

        .text
main:
        begin
        push    $ra

        la      $a0, list       # $a0 <- **List
        lw      $a0, ($a0)      # $a0 <- *List
        jal     max

        move    $a0, $v0
        li      $v0, 1
        syscall

        li      $v0, 11
        li      $a0, '\n'
        syscall

        pop     $ra
        end

        li      $v0, 0
        jr      $ra

max:

max__if_null:
        bne     $a0, NULL, max__else

        li      $v0, -1
        b       max__epilogue

max__else:

        # $t0 <- int max
        lw      $t0, NODE_OFFSET_VALUE($a0)

        # $t1 <- Node* curr
        lw      $t1, NODE_OFFSET_NEXT($a0)

max__while:
        beq     $t1, NULL, max__while_end

max__while_if:
        lw      $t2, NODE_OFFSET_VALUE($t1)
        ble     $t2, $t0, max__while_end_if

        move    $t2, $t0

max__while_end_if:
        lw      $t1, NODE_OFFSET_NEXT($t1)
        b       max__while

max__while_end:
        move    $v0, $t0

max__epilogue:
        jr      $ra

        .data
node4:  .word 2, NULL
node3:  .word 5, node4
node2:  .word 4, node3
node1:  .word 6, node2
list:   .word node1
