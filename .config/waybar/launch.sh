#!/usr/bin/env bash

kill -9 `pidof waybar`
waybar &
# waybar -c $HOME/.config/waybar/bottom.json -s $HOME/.config/waybar/bottom.css &
