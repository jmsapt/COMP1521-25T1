        .text
main:
        begin
        push    $ra

        li      $a0, 11
        li      $a1, 13
        li      $a2, 17
        li      $a3, 19
        jal     sum4

        move    $a0, $v0
        li      $v0, 1
        syscall

        li      $a0, '\n'
        li      $v0, 11
        syscall

        pop     $ra
        end

        li      $v0, 0
        jr      $ra

sum2:
        begin
        add     $v0, $a0, $a1

        end
        jr      $ra

sum4:
        begin
        push    $ra
        push    $s0
        push    $s1
        push    $s2

        move    $s0, $a2
        move    $s1, $a3

        jal     sum2
        move    $s2, $v0

        move    $a0, $s0
        move    $a1, $s1
        jal     sum2

        add     $v0, $v0, $s2

        pop     $s2
        pop     $s1
        pop     $s0
        pop     $ra
        end

        jr      $ra

