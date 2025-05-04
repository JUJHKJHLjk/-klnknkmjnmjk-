import sys
sys.path.append(".")  # 👈 This tells Python to look in your current folder for pyMeow

from pyMeow import *
import time

def test_draw():
    window = get_window("Roblox Player")

    if not window:
        print("Window not found.")
        return

    print("Window found!")

    for _ in range(500):  # Run for ~5 seconds
        screen = new_frame(window)
        draw_text(screen, "TEST BOX", (960, 500), color=rgb("red"))
        draw_rect(screen, (935, 475, 50, 50), color=rgb("green"), thickness=2)
        end_frame(screen)
        time.sleep(0.01)

test_draw()


