#!/bin/sh

echo "preload = $(cat ~/.cache/wal/wal)" >~/.config/hypr/hyprpaper.conf
echo "wallpaper = ,$(cat ~/.cache/wal/wal)" >>~/.config/hypr/hyprpaper.conf
killall hyprpaper
hyprpaper &
