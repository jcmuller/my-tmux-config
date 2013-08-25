#!/bin/bash

capacity=`ioreg -k CurrentCapacity |
  fgrep -e MaxCapacity -e CurrentCapacity |
  tr '\n' ' | ' |
  awk '{printf("%d", $10/$5 * 100)}'`

# Print a bar from 0 to 100. For example, print_bar 30 yields [|||       ]
bar() {
  value=$[$1 / 10]
  left=$[10 - $value]
  printf "[%0${value}s%${left}s] " | tr '0' '|'
}

printf "%s %d%%" "$(bar $capacity)" "$capacity"
