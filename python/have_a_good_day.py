from pynput.mouse import Button, Controller
from pynput.keyboard import Key
from pynput.keyboard import Controller as Controller_Key
import random
import time
mouse = Controller()
keyboard = Controller_Key()
import random

while True:
    # Read pointer position
    time.sleep(0.005)
    m1 = random.randint(100, 900)
    m2 = random.randint(300, 1000)
    # Set pointer position
    mouse.position = (m1, m2)
    sleep = random.randint(1,4)
    time.sleep(sleep)

    keyboard.press(Key.down)
    # sleep2 = random.randint(1,3)
    # time.sleep(sleep2)
    # print('2-', sleep2)
    keyboard.press(Key.right)

    sleep3 = random.randint(1, 3)
    # print('3-', sleep3)
    time.sleep(sleep3)

    keyboard.press(Key.right)
    keyboard.press(Key.space)

    # time.sleep(sleep2)

    keyboard.press(Key.right)
    keyboard.press(Key.space)

    master_rand = random.randint(100, 200)
    if ( master_rand % 7 == 0 ):
      print("===", master_rand / 10)
      time.sleep(master_rand / 10)
