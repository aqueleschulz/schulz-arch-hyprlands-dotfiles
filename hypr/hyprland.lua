-- ~/.config/hypr/hyprland.lua
---@module 'hl'

-- Configura o caminho de busca do Lua para encontrar a subpasta lua/
local config_dir = os.getenv("HOME") .. "/.config/hypr/"
package.path = config_dir .. "lua/?.lua;" .. package.path

-- Importação dos módulos
require("environment")
require("monitors")
require("input")
require("appearance")
require("animations")
require("rules")
require("keybindings")
require("autostart")
require("lua.workspaces")
