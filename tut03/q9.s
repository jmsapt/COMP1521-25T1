        .text
main:
        # char *s: $t0 = &string[0]
        la      $t0, string

        # int length: $t1 = 0
        li      $t1, 0
loop:
        lb      $t2, ($t0)
        beq     $t2, '\0', end

        add     $t0, $t0, 1
        add     $t1, $t1, 1

        b       loop
end:

        move    $a0, $t1
        li      $v0, 1
        syscall

        li      $v0, 11
        li      $a0, '\n'
        syscall


        li      $v0, 0
        jr      $ra

        .data
string:
        .asciiz "hello world"
