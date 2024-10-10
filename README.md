# arduino-learn

blik.ino - adjusted tutorial file with "morse" code blinking

-------

*.d files:

ldc2 -betterC -Oz -mtriple=avr -mcpu=atmega328p -Xcc=-mmcu=atmega328p -gcc=avr-gcc delay.d

avr-objcopy -O ihex -R .eeprom delay delay.hex

avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:delay.hex

-------

*.go files: require tinygo: https://github.com/tinygo-org/tinygo
