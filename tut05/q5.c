#define READING 0x01
#define WRITING 0x02
#define AS_BYTES 0x04
#define AS_BLOCKS 0x08
#define LOCKED 0x10

unsigned char device;
int main(int argc, char *argv[]) {
    // mark the device as locked for reading bytes
    device = LOCKED | READING | AS_BYTES;

    // mark the device as locked for writing blocks
    device = LOCKED | READING | AS_BLOCKS;

    // set the device as locked, leaving other flags unchanged
    device |= LOCKED;

    // remove the lock on a device, leaving other flags unchanged
    device ^= LOCKED;

    // switch a device from reading to writing, leaving other flags unchanged
    device = (device & ~READING) | WRITING;

    // swap a device between reading and writing, leaving other flags unchanged
    device = (device ^ READING) ^ WRITING;
    device = device ^ (READING | WRITING);
}
