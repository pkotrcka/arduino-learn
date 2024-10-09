import ldc.llvmasm;

// Ports from the delay_basic.h in the thing
void _delay_loop_1(ubyte __count) {
	// this template param is required to avoid
	// assertion `!Call.getType()->isVoidTy() && "Bad inline asm!"' failed.

        __asm!ubyte (
                "1: dec $0\n\tbrne 1b",
                "=r,0", (__count)
        );
}
void _delay_loop_2(ushort __count) {
        __asm!ushort (`
	1: sbiw $0,1
	brne 1b
	`,
	`=w,0`,
	__count);
}

// port from delay.h in arduino thing
enum F_CPU = 1000000UL;

// this was _delay_ms but i did something wrong and changed double to int and i still don't love it
void _delay(int __ms) {
	ushort __ticks;
	ulong __tmp = (F_CPU * __ms) / 4000;
	if(__tmp < 1)
		__ticks = 1;
	else if(__tmp > 65535) {
		__ticks = cast(ushort) (__ms * 10.0);
		while(__ticks) {
			_delay_loop_2(cast(ushort) (((F_CPU) / 4e3) / 10));
			__ticks--;
		}
		return;
	} else
		__ticks = cast(ushort) __tmp;
	_delay_loop_2(__ticks);
}


// and this is from WebFreak's sample code on the D wiki

enum AVR_ARCH = 5; // AVR architecture of your MCU

static if (AVR_ARCH >= 100) {
 enum SFR_OFFSET = 0x00;
} else {
 enum SFR_OFFSET = 0x20;
}

enum ubyte* MMIO_BYTE(ubyte memAddr) = cast(ubyte*) memAddr;
enum ubyte* SFR_IO8(ubyte ioAddr) = MMIO_BYTE!(ioAddr + SFR_OFFSET);

enum ubyte* PINB = SFR_IO8!(0x03);
enum ubyte* DDRB = SFR_IO8!(0x04);
enum ubyte* PORTB = SFR_IO8!(0x05);

extern(C) void main() {
  import core.volatile;

  volatileStore(DDRB, 0xFF);  // Set all PORT B to output

  // and I added the delays

  while (true) {
    volatileStore(PORTB, 0xFF); // Set all PORT B to high
    foreach(i; 0 .. 10)
    	_delay(1000);
    volatileStore(PORTB, 0x00); // Set all PORT B to low
    foreach(i; 0 .. 20)
    	_delay(1000);
  }
}
