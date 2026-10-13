#include <stdint.h>

#define MATH_OUT_PORT 0x72
#define DISPLAY_DATA_PORT 0x78

static inline uint8_t inb(uint16_t port) {
    uint8_t ret;
    asm volatile ("inb %1, %0" : "=a"(ret) : "Nd"(port));
    return ret;
}

static inline void outb(uint16_t port, uint8_t val) {
    asm volatile ("outb %0, %1" : : "a"(val), "Nd"(port));
}

void process_display_io(void) {
    uint8_t raw_math_data = inb(MATH_OUT_PORT);
    if (raw_math_data != 0) {
        outb(DISPLAY_DATA_PORT, raw_math_data);
    }
}
