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
  import core.bitop;

  volatileStore(DDRB, 0xFF);  // Set all PORT B to output

  while (true) {
    volatileStore(PORTB, 0xFF); // Set all PORT B to high
  }
}
