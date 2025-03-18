/* Do as I say, not as I do
 *
 * `constexpr` and `static_assert` are c23 features, don't try use if you don't
 * know what they do
 */

#include <assert.h>
#include <stdint.h>

// a 0b0101010101010101
// b 0b1010101010101010
// c 0b0000000000000001
constexpr uint16_t a = 0x5555, b = 0xAAAA, c = 0x0001;

// a)
static_assert((a | b) == 0xffff);

// b)
static_assert((a & b) == 0b0);

// c)
static_assert((a ^ b) == 0xffff);

// d)
// 0b0101010101010101
// 0b0101010101010101
static_assert((a & ~b) == a);

// e)
static_assert((c << 6) == 0b1000000);

// f)
static_assert((a >> 4) == 0b0000010101010101);

// g)
// a 0b0101010101010101
// b 0b0101010101010100
static_assert((a & (b << 1)) == 0b0101010101010100);
static_assert((a & (b << 1)) == a - 1);

// h)
static_assert((b | c) == 0b1010101010101011);
static_assert((b | c) == b + 1);

// i)
 static_assert((a & ~c) == 0b0101010101010100);
 static_assert((a & ~c) == a - 1);
