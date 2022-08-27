#!/usr/bin/env bash

waybar_pid="$(ps -ef | ag 'waybar' | awk '{if ($8=="waybar") print $2}')"
if [ -n $waybar_pid ]; then
  kill -9 $waybar_pid
fi
waybar &
# waybar -c $HOME/.config/waybar/bottom.json -s $HOME/.config/waybar/bottom.css &
