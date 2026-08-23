-- ~/.config/hypr/lua/monitors.lua
---@module 'hl'

-- Primary Ultrawide display mapping
hl.monitor({
    output = "HDMI-A-1",
    mode = "2560x1080@60",
    position = "0x0",
    scale = 1
})

-- Secondary display mirroring
-- hl.monitor({
--    output = "HDMI-A-1",
--    mode = "preferred",
--    position = "auto",
--   scale = 1,
--    mirror = "DP-2"
--})

-- Hardware cursor fix for NVIDIA GPUs
hl.config({
    cursor = {
        no_hardware_cursors = true
    }
})
