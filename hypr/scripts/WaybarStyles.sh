#!/bin/bash

# === LOG DE DEBUG ===
exec > /tmp/waybar_style.log 2>&1

# === GARANTIR PATH ===
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin

# === CONFIG ===
waybar_styles="$HOME/.config/waybar/style"
waybar_style_css="$HOME/.config/waybar/style.css"
SCRIPTSDIR="$HOME/.config/hypr/scripts"
rofi_config="$HOME/.config/rofi/config.rasi"

# Verifica se a pasta de estilos existe
if [ ! -d "$waybar_styles" ]; then
    notify-send "Erro" "Pasta de estilos da Waybar não encontrada."
    exit 1
fi

# === FUNCTION: RESTART WAYBAR ===
# Se o wbrestart.sh falhar, este comando manual resolve
restart_waybar() {
    pkill waybar
    sleep 0.5
    waybar &
}

# === SELEÇÃO COM ROFI ===
# Busca os arquivos .css e limpa a lista
choice=$(find -L "$waybar_styles" -maxdepth 1 -type f -name '*.css' -printf "%f\n" | \
         sed 's/\.css$//' | sort | \
         rofi -i -dmenu -p "󰃟 Escolher Estilo Waybar" -config "$rofi_config")

# Se cancelar (ESC), sai
if [[ -z "$choice" ]]; then
    echo "Nenhuma opção selecionada."
    exit 0
fi

# === APLICAR ESTILO ===
SELECTED_FILE="$waybar_styles/$choice.css"

if [ -f "$SELECTED_FILE" ]; then
    ln -sf "$SELECTED_FILE" "$waybar_style_css"
    
    # Tenta rodar o script oficial, se falhar, usa o restart manual
    if [ -f "${SCRIPTSDIR}/wbrestart.sh" ]; then
        bash "${SCRIPTSDIR}/wbrestart.sh" &
    else
        restart_waybar
    fi
    
    notify-send "Waybar" "Estilo '$choice' aplicado com sucesso!"
else
    notify-send "Erro" "Arquivo de estilo não encontrado."
fi
