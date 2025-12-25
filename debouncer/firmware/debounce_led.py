import shrike
from machine import Pin
from time import sleep

shrike.flash("debounce.bin")

bd = Pin(2, Pin.IN)
db = Pin(16, Pin.IN)
led = Pin(4, Pin.OUT)

while True:
    bd_state = bd.value()	#button debounced
    db_state = db.value()	#direct button
    led.value(bd_state)
    print(bd_state, db_state)
    sleep(0.01)