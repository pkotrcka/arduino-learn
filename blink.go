package main

import (
    "machine"
    "time"
)

func main() {
    led1 := machine.D10
    led2 := machine.D11
    led3 := machine.D12
    led4 := machine.D13
    led1.Configure(machine.PinConfig{Mode: machine.PinOutput})
    led2.Configure(machine.PinConfig{Mode: machine.PinOutput})
    led3.Configure(machine.PinConfig{Mode: machine.PinOutput})
    led4.Configure(machine.PinConfig{Mode: machine.PinOutput})
    for {
        led1.Low()
	led2.Low()
	led3.Low()
	led4.Low()
        time.Sleep(time.Millisecond * 100)

	led1.Low()
	led2.Low()
	led3.Low()
	led4.High()
	time.Sleep(time.Millisecond * 100)

	led1.Low()
	led2.Low()
	led3.High()
	led4.Low()
	time.Sleep(time.Millisecond * 100)

	led1.Low()
	led2.Low()
	led3.High()
	led4.High()
	time.Sleep(time.Millisecond * 100)

	led1.Low()
	led2.High()
	led3.Low()
	led4.Low()
	time.Sleep(time.Millisecond * 100)

	led1.Low()
	led2.High()
	led3.Low()
	led4.High()
	time.Sleep(time.Millisecond * 100)

	led1.Low()
	led2.High()
	led3.High()
	led4.Low()
	time.Sleep(time.Millisecond * 100)

	led1.Low()
	led2.High()
	led3.High()
	led4.High()
	time.Sleep(time.Millisecond * 100)

	led1.High()
	led2.Low()
	led3.Low()
	led4.Low()
	time.Sleep(time.Millisecond * 100)

	led1.High()
	led2.Low()
	led3.Low()
	led4.High()
	time.Sleep(time.Millisecond * 100)

	led1.High()
	led2.Low()
	led3.High()
	led4.Low()
	time.Sleep(time.Millisecond * 100)

	led1.High()
	led2.Low()
	led3.High()
	led4.High()
	time.Sleep(time.Millisecond * 100)

	led1.High()
	led2.High()
	led3.Low()
	led4.Low()
	time.Sleep(time.Millisecond * 100)

	led1.High()
	led2.High()
	led3.Low()
	led4.High()
	time.Sleep(time.Millisecond * 100)

	led1.High()
	led2.High()
	led3.High()
	led4.Low()
	time.Sleep(time.Millisecond * 100)

        led1.High()
	led2.High()
	led3.High()
	led4.High()
        time.Sleep(time.Millisecond * 100)
    }
}
