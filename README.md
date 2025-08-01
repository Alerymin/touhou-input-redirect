# Touhou keyboard to controller input redirect for linux
Easy script to redirect keyboard input from keyboard to controller with default settings for Touhou.

## Why ?
I needed to play multiplayer on Touhou 3, but it only works in splitscreen and split keyboard, I needed a way to make one keyboard act like a controller and another to act as a real keyboard.
A reputed program to make one keyboard act as a controller, but not any other is [KeyboardSplitter](https://github.com/djlastnight/KeyboardSplitterXbox), but it missed a linux version.
I searched a bit and found that xboxdrv works great with it, so I set it up for Touhou, initially for Touhou 3 because there is no netplay, but it works great with any touhou game.

## Requirements
- [xboxdrv](https://github.com/xboxdrv/xboxdrv)

## How to use ?

WARNING: THE KEYBOARD WILL NOT BE USABLE ON THE PC WHILE THIS IS RUNNING. MAKE SURE YOU HAVE ANOTHER WAY TO INTERACT WITH YOUR PC AND STOP THE PROGRAM TO GET YOUR KEYBOARD BACK.

Run the script as root or with sudo
Add your keyboard as a parameter. Find it in /dev/input/by-id

A 10 seconds delay has been added to let the user read the warning message and leave all keys released.
Do not remove this delay as a held key when xboxdrv starts will stay held as long as xboxdrv is running.

## How to change redirected keys ?
At the end of the file, there are all the keys mapped, I don't have a source for the keys but it looks similar to evdev codes, let me know if you know where I can find the list.
To map the keyboard, use the evdev codes, I found the list on the rust language documentation: https://docs.rs/evdev-keys/latest/evdev_keys/all.html

then follow a pattern like this:
```
KEY_X=a,\
KEY_Z=b,\
KEY_LEFTSHIFT=x,\
KEY_UP=DPAD_UP,\
KEY_DOWN=DPAD_DOWN,\
KEY_RIGHT=DPAD_RIGHT,\
KEY_LEFT=DPAD_LEFT
```

## Why xboxdrv ?
I heard [MoltenGamepad](https://github.com/jgeumlek/MoltenGamepad) works too but when I tried it put a mess on my pc, so I fell back to old xboxdrv, I never had any issue.
Let me know if you have a better solution.
