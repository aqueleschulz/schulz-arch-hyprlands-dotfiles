-- ~/.config/hypr/lua/appearance.lua
---@module 'hl'

local theme = require("colors")

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,

        -- Agrupamento correto das cores de borda exigido pela nova API
        col = {
            active_border = theme.outline,
          inactive_border = theme.outline_variant,
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle"
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 0.8,
        shadow = {
            enabled = false,
          range = 4,
          render_power = 3,
          color = theme.shadow
        },
        blur = {
            enabled = true,
          size = 5,
          passes = 3,
          ignore_opacity = true,
          new_optimizations = true,
          special = false,
          popups = true,
          xray = true,
          vibrancy = 0.1696
        }
    },
    dwindle = {
        preserve_split = true
    },
    master = {
        new_status = "master"
    },
    misc = {
        force_default_wallpaper = 0,
            disable_hyprland_logo = true
            -- Chave 'vfr' removida (agora é sempre ativada por padrão no Hyprland)
    }
})
