#include <assert.h>

typedef unsigned int Word;

Word reverseBits(Word w) {
    Word result = 0u;

    for (int i = 0; i < 32; ++i) {
        if (w & (1u << i))
            result |= 1u << (31 - i);
    }

    return result;
}

int main(void) {
    assert(reverseBits(0u) == 0u);
    assert(reverseBits(0xffffffffu) == 0xffffffffu);
    assert(reverseBits(0x00000001u) == 0x80000000u);

    // given example
    assert(reverseBits(0x01234567u) == 0xE6A2C480u);

    return 0;
}
