-- ~/.config/hypr/lua/input.lua
---@module 'hl'

-- Core input configuration
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "intl",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        accel_profile = "flat",
        force_no_accel = 1,
            touchpad = {
                natural_scroll = true
            }
    }
})

-- Native workspace swiping gesture
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Per-device configurations
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5
})
