const std = @import("std");

export fn _start() callconv(.C) noreturn {
    var port_status: u8 = 0;
    const math_port: u16 = 0x70;

    asm volatile ("inb %[port], %[val]"
        : [val] "={al}" (port_status),
        : [port] "N" (math_port),
    );

    if (port_status != 0) {
        asm volatile ("outb %[val], %[port]"
            :
            : [val] "{al}" (port_status),
              [port] "N" (@as(u16, 0x71)),
        );
    }

    while (true) {
        asm volatile ("hlt");
    }
}
