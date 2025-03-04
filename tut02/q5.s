# Constant
SQUARE_MAX = 46340

        .text
main:
        li      $v0, 4
        la      $a0, prompt_str
        syscall

        li      $v0, 5
        syscall
        move    $t0, $v0 # $t0 -> int x

        bgt     $t0, SQUARE_MAX, too_big

        # y = x * x;
        mul     $t1, $t0, $t0

        # printf("%d\n", y);
        move    $a0, $t1
        li      $v0, 1
        syscall

        li      $a0, '\n'
        li      $v0, 11
        syscall

        b       end

too_big:
        # printf("square too big for 32 bits\n");
        li      $v0, 4
        la      $a0, too_big_str
        syscall

end:
        li      $v0, 0
        jr      $ra


        .data
prompt_str:
        .asciiz "Enter a number: "
too_big_str:
        .asciiz "square too big for 32 bits\n"
