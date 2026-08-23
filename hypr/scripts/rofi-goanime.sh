#!/bin/bash

# 1. Abre o rofi para o usuário digitar o nome do anime.
# Dica: O usuário pode digitar "naruto" ou "naruto dublado"
ANIME_NAME=$(rofi -dmenu -i -p "Buscar Anime (PT-BR):" -theme-str 'window {width: 1000px;}')

# 2. Verifica se o usuário digitou algo (se não apertou Esc)
if [ -n "$ANIME_NAME" ]; then
    
    # 3. Abre o emulador de terminal rodando o goanime
    # ATENÇÃO: Substitua 'alacritty' pelo terminal que você usa no Arch Linux 
    # Exemplos: kitty, konsole, gnome-terminal --, xfce4-terminal -e
    
    kitty -e goanime --source animefire "$ANIME_NAME"
fi
