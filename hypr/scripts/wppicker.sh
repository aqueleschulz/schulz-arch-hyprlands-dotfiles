#!/bin/bash

# === LOG DE ERROS ===
# Isso criará um log em /tmp/wppicker.log sempre que você apertar Super+W.
# Se falhar, você saberá exatamente o porquê.
exec > /tmp/wppicker.log 2>&1

# === GARANTIR PATH ===
# O Hyprland às vezes tem um ambiente limpo demais. Isso garante que ele ache seus apps.
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin

# === CONFIG ===
WALLPAPER_DIR="$HOME/Imagens/Wallpapers"
SYMLINK_PATH="$HOME/.config/hypr/current_wallpaper"

# Verifica se o diretório existe
if [ ! -d "$WALLPAPER_DIR" ]; then
    notify-send "Erro" "Diretório de wallpapers não encontrado: $WALLPAPER_DIR"
    exit 1
fi

# === EXECUTE SWWW DAEMON ===
# Garante que o motor do wallpaper está ligado
awww-daemon & 
sleep 0.1 # Pequena pausa para o daemon estabilizar se acabou de ligar

# === ICON-PREVIEW SELECTION WITH ROFI ===
# Adicionado a flag -drun-use-desktop-cache para performance (opcional)
SELECTED_WALL=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.jpeg" \) -printf "%f\n" | \
    sort | while read -r a; do 
        echo -en "$a\0icon\x1f$WALLPAPER_DIR/$a\n"
    done | \
    rofi -dmenu -i -p "🖼️ Wallpaper")

# Se o usuário cancelar (ESC), sai do script
if [ -z "$SELECTED_WALL" ]; then
    echo "Seleção cancelada pelo usuário."
    exit 0
fi

SELECTED_PATH="$WALLPAPER_DIR/$SELECTED_WALL"

# === SET WALLPAPER ===
awww img "$SELECTED_PATH" \
    --transition-type grow \
    --transition-pos "0.5,0.5" \
    --transition-fps 60 \
    --transition-duration 1.5

# === GENERATE COLORS (MATUGEN) ===
if command -v matugen &> /dev/null; then
    matugen image "$SELECTED_PATH"
else
    echo "Matugen não encontrado."
fi

# === CREATE SYMLINK ===
mkdir -p "$(dirname "$SYMLINK_PATH")"
ln -sf "$SELECTED_PATH" "$SYMLINK_PATH"

notify-send "Wallpaper Alterado" "Atualizado para: $SELECTED_WALL"
