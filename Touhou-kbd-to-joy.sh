#!/bin/sh

# Root permissions check
if [[ $(id -u) -ne 0 ]]; then
    echo "This script needs to be run as root"
    exit
fi

# Check if xboxdrv is installed
if ! command -v xboxdrv --version >/dev/null 2>&1 ; then
    echo "This program needs xboxdrv"
    exit
fi

# Check if keyboard has been given
if [[ -z $1 ]]; then
    echo "Add the keyboard that will act as a controller as an argument. Use the path starting with /dev/input/by-id"
    exit
fi

DEVPATH=$1

# Check if keyboard exists
if [ ! -e "$DEVPATH" ]; then
    echo "Invalid device path. Use the path starting with /dev/input/by-id"
    exit
fi

# Warning message
cat << EOF
#######################################################################################
Using $DEVPATH as controller.
Release every key on the keyboard.

THE KEYBOARD WILL NOT BE USABLE ON THE PC WHILE THIS IS RUNNING.
IF IT WOULD LEAVE YOU WITH NO INPUT TO MANAGE YOUR COMPUTER, PRESS CTRL+C IMMEDIATELY.

Starting input translation in 10 seconds.
To stop the script, close the terminal window with a mouse or another keyboard.
Stopping the script will automatically give you back your keyboard.
#######################################################################################
EOF

# Safety delay
sleep 10
echo "Input translation started"

# Staring xboxdrv to for input translation
xboxdrv --evdev $DEVPATH --mimic-xpad --evdev-keymap \
KEY_X=a,\
KEY_Z=b,\
KEY_LEFTSHIFT=x,\
KEY_UP=DPAD_UP,\
KEY_DOWN=DPAD_DOWN,\
KEY_RIGHT=DPAD_RIGHT,\
KEY_LEFT=DPAD_LEFT
