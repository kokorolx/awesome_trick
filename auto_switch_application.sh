#!/bin/bash
while [ 1 ]; do
  xdotool mousemove 200 218 click 1 &
  sleep 7
  xdotool keydown alt key Tab; sleep 2; xdotool keyup alt
  sleep 7
done
