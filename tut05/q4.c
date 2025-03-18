#include <assert.h>
#include <stdint.h>
#include <stdio.h>

uint32_t middle_six(uint32_t num) { 
    uint32_t a = num >> 13;
    uint32_t b = a << 26;
    uint32_t c = b >> 13;
    return c;
}

int main(void) {
    assert(middle_six(0xffffffff) == 0b00000000000001111110000000000000);
    assert(middle_six(0x0) == 0);

    return 0;
}
