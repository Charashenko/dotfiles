#!/bin/bash

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar lmenu &
sleep 0.05
polybar rmenu &
sleep 0.05
polybar rclock &
sleep 0.05
polybar back &
