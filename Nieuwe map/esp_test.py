import pygetwindow as gw
import time
import pymeow  # Assuming pymeow is the library you're using to interact with the window

def main_menu():
    print("=== ESP Menu ===")
    print("1. Start ESP")
    print("2. Exit")
    
    choice = input("Enter your choice: ")
    
    if choice == "1":
        start_esp()
    elif choice == "2":
        exit()
    else:
        print("Invalid choice. Try again.")
        main_menu()

def start_esp():
    # List all open window titles to find the exact Roblox window title
    window_titles = gw.getAllTitles()  # Get all window titles
    print("Open windows:", window_titles)  # Print all window titles for inspection

    window = None
    for title in window_titles:
        if "Roblox" in title:  # Find a window that contains "Roblox" in the title
            window = gw.getWindowsWithTitle(title)[0]  # Select the first match
            print("Found window:", window.title)
            break

    if window is None:
        print("Window not found.")
        return

    # Example dummy entity list (simulate positions for now)
    entities = [
        {"name": "Enemy1", "pos": (500, 400)},
        {"name": "Enemy2", "pos": (700, 300)},
    ]

    time.sleep(1)

    while window.isActive:
        screen = pymeow.new_frame(window)  # Create a new frame to draw on

        # Draw ESP elements
        for entity in entities:
            x, y = entity["pos"]
            # Draw the entity name
            pymeow.draw_text(screen, entity["name"], (x, y - 15), color=pymeow.rgb("red"))
            # Draw a rectangle around the entity (ESP box)
            pymeow.draw_rect(screen, (x - 25, y - 25, 50, 50), color=pymeow.rgb("green"), thickness=2)

        pymeow.end_frame(screen)  # Finalize and render the frame
        time.sleep(0.01)  # Small delay to control the update rate

# Show the menu
main_menu()
