#!/bin/bash

# To find your current layout, run
#   # tmux list-windows -F "#{window_active} #{window_layout}" | grep "^1" | cut -d " " -f 2
case $1 in
  laptop)
    layout='644d,272x78,0,0{80x78,0,0[80x33,0,0,38,80x33,0,34,36,80x10,0,68,16],191x78,81,0[191x67,81,0,6,191x10,81,68,65]}'
    ;;
  cinema)
    layout='5765,364x94,0,0{80x94,0,0[80x41,0,0,38,80x41,0,42,36,80x10,0,84,16],283x94,81,0[283x83,81,0,6,283x10,81,84,65]}'
    ;;
  *)
    echo "Please specify one of laptop, cinema"
    exit
esac

tmux select-layout $layout > /dev/null
tmux display-message "Selected $1 layout"
