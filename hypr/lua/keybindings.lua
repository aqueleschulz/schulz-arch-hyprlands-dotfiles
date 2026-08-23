-- ~/.config/hypr/lua/keybindings.lua
---@module 'hl'

local mainMod = "SUPER"
local terminal = "kitty --hold fastfetch"
local menu = "rofi -show drun"
local fileManager = "thunar"
local scriptsDir = os.getenv("HOME") .. "/.config/hypr/scripts/"

-- System and window operations
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("[float;size 800 550] " .. terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())
hl.bind("CTRL + ALT + Delete", hl.dsp.exit())

-- App launchers and tools
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("kitty yazi"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("xdg-open 'https://'"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(scriptsDir .. "hyprlock.sh"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + CTRL + O", hl.dsp.exec_cmd(scriptsDir .. "rofi-goanime.sh"))

-- Custom scripts bindings
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd(scriptsDir .. "screenshot.sh"))
hl.bind("PRINT", hl.dsp.exec_cmd(scriptsDir .. "screenshot.sh"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(scriptsDir .. "wppicker.sh"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(scriptsDir .. "KillActiveProcess.sh"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(scriptsDir .. "wbrestart.sh"))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd(scriptsDir .. "WaybarStyles.sh"))
hl.bind(mainMod .. " + ALT + B", hl.dsp.exec_cmd(scriptsDir .. "WaybarLayout.sh"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))

-- Focus management
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Window movement
hl.bind(mainMod .. " + CTRL + left", hl.dsp.exec_cmd("hyprctl dispatch movewindow l"))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.exec_cmd("hyprctl dispatch movewindow r"))
hl.bind(mainMod .. " + CTRL + up", hl.dsp.exec_cmd("hyprctl dispatch movewindow u"))
hl.bind(mainMod .. " + CTRL + down", hl.dsp.exec_cmd("hyprctl dispatch movewindow d"))

-- Active window resizing with repeat flag
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -50 0"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 50 0"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -50"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 50"), { repeating = true })

-- Workspace assignment via dynamic iteration
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
    end
    hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
    hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

    -- Workspace scrolling
    hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

    -- Mouse interactions for window manipulation
    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- Audio and brightness controls
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(scriptsDir .. "volume.sh --inc"), { repeating = true })
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(scriptsDir .. "volume.sh --dec"), { repeating = true })
    hl.bind("XF86AudioMute", hl.dsp.exec_cmd(scriptsDir .. "volume.sh --toggle"))
    hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
    hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(scriptsDir .. "brightness.sh --inc"), { repeating = true })
    hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(scriptsDir .. "brightness.sh --dec"), { repeating = true })

    -- Media controls bypassing lockscreen
    hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
