        .text
main:
        # $t0 -> int x

init:
        li      $t0, 24
cond:
        bge     $t0, 42, end

body:
        li      $v0, 1
        move    $a0, $t0
        syscall

        li      $v0, 11
        li      $a0, '\n'
        syscall

step:
        addi    $t0, $t0, 3
        b       cond

end:
        # return 0
        li      $v0, 0
        jr      $ra


        .data
