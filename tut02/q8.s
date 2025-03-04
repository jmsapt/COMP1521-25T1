main:

outer_init:
        # i = 1; // t0
        li      $t0, 1

outer_cond:
        # if (i > 10) goto outer_end;
        bgt     $t0, 10, outer_end

inner_init:
        # j = 0; // t1
        li      $t1, 0

inner_cond:
        # if (j >= i) goto inner_end;
        bge     $t1, $t0, inner_end

        # printf("*");
        li      $v0, 11
        li      $a0, '*'
        syscall

inner_step:
        # j++; => j = j + 1
        addi    $t1, $t1, 1
        # goto inner_cond;
        b       inner_cond

inner_end:
        # printf("\n");
        li      $v0, 11
        li      $a0, '\n'
        syscall

outer_step:
        # i++;
        addi    $t0, $t0, 1

        # goto outer_cond;
        b       outer_cond

outer_end:
        # return 0;
        li      $v0, 0
        jr      $ra
