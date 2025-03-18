#include <stdint.h>
#include <stdio.h>

uint8_t printerControl = 0; // 0b 0000 0000

// Whether the printer is out of ink
#define NO_INK (0x1) // 0b 0000 0001
// Whether to print/scan in colour
#define COLOUR (0x2) // 0b 0000 0010
// Select print mode
#define SELECT_PRINT (0x4) // 0b 0000 0100
// Select scan mode
#define SELECT_SCAN (0x8) // 0b 0000 1000
// Start print/scan
#define START (0x10) // 0b 0001 0000

// that prints (to terminal) whether the printer is out of ink.
void out_of_ink(uint8_t *p) {
    if (*p & NO_INK) {
        printf("Out of ink");
    }
}
// that tells the printer the ink has been replaced.
void ink_replaced(uint8_t *p) { *p = *p & ~NO_INK; }

// to use colour and select scan mode. Assume no mode has been selected yet.
void b(uint8_t *p) { *p |= COLOUR | SELECT_SCAN; }

// that toggles between print and scan mode. Assume 1 mode is already selected.
void c(uint8_t *p ) {
    // *p ^= SELECT_SCAN | SELECT_PRINT;
    *p = (*p ^ SELECT_SCAN) ^ SELECT_PRINT;

}

// (Extension question) to start printing/scanning. It should:
//     check that one (and only one) mode is selected
//     check there's ink if printing.
//     print (to terminal) what it's doing and any error messages.
//     wait until the printing/scanning is finished and print a 'finished'
//     message. Since there isn't an actual printer on the other side, a correct
//     implementation of this will infinite loop and never print 'finished'.
