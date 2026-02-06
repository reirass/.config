#!/bin/bash

WALLPAPER_DIR="/dr/hd/DownloadsHD/Wallpapers"
HYPRPAPER_CONF="$HOME/.config/hypr/hyprpaper.conf"

# Escolher pasta com rofi
PASTA=$(ls -1 "$WALLPAPER_DIR" | rofi -dmenu -p "Pasta de Wallpapers")

[ -z "$PASTA" ] && exit 0

# Abrir yazi e capturar o arquivo escolhido
IMG=$(kitty --class yazi-wallpaper -e yazi "$WALLPAPER_DIR/$PASTA" --chooser-file /tmp/yazi_wallpaper_choice)

# Lê o arquivo escolhido
if [ -f /tmp/yazi_wallpaper_choice ]; then
  IMG_PATH=$(cat /tmp/yazi_wallpaper_choice)
  rm /tmp/yazi_wallpaper_choice
else
  exit 0
fi

# Garante que é um arquivo
[ ! -f "$IMG_PATH" ] && exit 0

# Atualiza hyprpaper.conf
sed -i "s|^path = .*|path = $IMG_PATH|" "$HYPRPAPER_CONF"

# Recarrega o hyprpaper
pkill hyprpaper
hyprpaper &

notify-send "Wallpaper alterado" "$(basename "$IMG_PATH")"
