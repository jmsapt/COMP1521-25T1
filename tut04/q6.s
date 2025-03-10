        .data
array:  .word 11, 15, 0, -10, 11, 9999, 3
        .text
main:
        # TODO load arguments
        jal     max

        # printf("%d\n")
        move    $a0, $v0
        li      $v0, 1
        syscall

        li      $v0, 11
        li      $a0, '\n'
        syscall

        li      $v0, 0
        jr      $ra

max:
    # Frame:    [...]   <-- FILL THESE OUT!
    # Uses:     [...]
    # Clobbers: [...]
    #
    # Locals:           <-- FILL THIS OUT!
    #   - ...
    #
    # Structure:        <-- FILL THIS OUT!
    #   max
    #   -> [prologue]
    #       -> body
    #   -> [epilogue]
max__prologue:


max__body:

max__epilogue:

