        .data
array:  .word 11, 15, 0, -10, 11, 9999, 3
        .text
main:
        begin
        push    $ra

        la      $a0, array
        li      $a1, 7

        jal     max

        # printf("%d\n")
        move    $a0, $v0
        li      $v0, 1
        syscall

        li      $v0, 11
        li      $a0, '\n'
        syscall

        pop    $ra
        end

        li      $v0, 0
        jr      $ra

max:
        # Frame:    []   <-- FILL THESE OUT!
        # Uses:     []
        # Clobbers: []
        #
        # Locals:           <-- FILL THIS OUT!
        #   - $t0: int first_element
        #   - $s0: int array[]
        #   - $s1: int length
        #   - $s2: int max_so_far
        #
        # Structure:        <-- FILL THIS OUT!
        #   max
        #   -> [prologue]
        #       -> max__if
        #       -> max__else
        #           -> max__if_max
        #           -> max__if_max_end
        #       -> max__else_if
        #   -> [epilogue]

max__prologue:
        begin
        push    $ra
        push    $s0
        push    $s1
        push    $s2


max__body:
        move    $s0, $a0
        move    $s1, $a1

        lw      $t0, ($s0)
max__if:
        bne     $s1, 1, max__else

        move    $v0, $t0
        b       max__epilogue

max__else:
        add     $a0, $s0, 4
        sub     $a1, $s1, 1
        jal     max

        move    $s2, $v0

        # $t0 is clobbered, we could use a save register
        # ... or just reload it from memory
        lw      $t0, ($s0)

max__if_max:
        ble     $t0, $s2, max__if_max_end
        move    $s2, $t0

max__if_max_end:
        move    $v0, $s2
        b       max__epilogue

max__end_if:

max__epilogue:
        pop     $s2
        pop     $s1
        pop     $s0
        pop     $ra
        end

        jr      $ra

