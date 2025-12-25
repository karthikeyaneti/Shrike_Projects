from machine import UART, Pin
from time import sleep
import shrike

shrike.flash("uart_led.bin")

uart = UART(0, baudrate=115200, tx=Pin(0), rx=Pin(1))

def send_value(value):
    uart.write(bytes([value]))
    
    # Print info
    print("Sent (hex): 0x{:02X}".format(value))
    print("Sent (bin): {:08b}".format(value))
    bits = [(value >> i) & 1 for i in range(7, -1, -1)]
    #print("Bits sent:", bits)
    
while True:
    cmd = input("Type 'on' or 'off': ").strip().lower()

    if cmd == "on":
        send_value(0xAB)
        print ("LED on")
    elif cmd == "off":
        send_value(0xFF)
        print ("LED off")
    else:
        print("Invalid input, type 'on' or 'off'")

    sleep(0.2)
