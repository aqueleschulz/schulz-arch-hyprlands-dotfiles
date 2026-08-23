-- ~/.config/hypr/lua/rules.lua
---@module 'hl'

-- Multimedia and image viewers
hl.window_rule({
    name = "mpv-vlc-float",
    match = { class = "^([Mm]pv|vlc)$" },
               float = true,
               size = "900 506",
               opacity = 1.0,
               no_blur = true
})

hl.window_rule({
    name = "system-tools-float",
    match = { class = "^(org\\.gnome\\.SystemMonitor|org\\.gnome\\.Evince|eog|org\\.gnome\\.Loupe)$" },
               float = true
})

-- System configuration windows
hl.window_rule({
    name = "network-bt-float",
    match = { class = "^(nm-applet|nm-connection-editor|blueman-manager|org\\.gnome\\.FileRoller|org\\.gnome\\.DiskUtility|wihotspot(-gui)?)$" },
               opacity = 0.8,
               float = true
})

hl.window_rule({
    name = "nautilus-opacity",
    match = { class = "^(org\\.gnome\\.Nautilus)$" },
               opacity = 0.8
})

hl.window_rule({
    name = "pavucontrol-float",
    match = { class = "^(org\\.pulseaudio\\.pavucontrol)$" },
               opacity = 0.9,
               float = true,
               size = "50% 60%"
})

-- Terminal and text editors
hl.window_rule({
    name = "term-editor-opacity",
    match = { class = "^(gedit|org\\.gnome\\.TextEditor|mousepad|kitty)$" },
               opacity = 0.9
})

-- Communication clients and web browsers
hl.window_rule({
    name = "discord-telegram-opacity",
    match = { class = "^(discord|vesktop|org\\.telegram\\.desktop)$" },
               opacity = 0.85
})

hl.window_rule({
    name = "spotify-opacity",
    match = { class = "^(Spotify)$" },
               opacity = 0.8
})

hl.window_rule({
    name = "zen-opacity",
    match = { class = "^(zen)$" },
               opacity = 0.9
})

-- Global behavioral constraints
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize"
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = { class = "^$", title = "^$", xwayland = true, float = true },
    no_focus = true
})

-- Floating behavior for dialogs and pickers
hl.window_rule({
    name = "dialogs-float",
    match = { title = "^(Save As|Save a File|Pick Files)$" },
               float = true,
               size = "50% 60%",
               center = 1
})

hl.window_rule({
    name = "open-files-float",
    match = { title = "^(Open Files)$" },
               float = true,
               size = "70% 60%"
})

-- UI layer effects (Waybar, swaync)
hl.layer_rule({
    name = "waybar-blur",
    match = { namespace = "waybar" },
    blur = true,
    ignore_alpha = 0.5
})

hl.layer_rule({
    name = "logout-blur",
    match = { namespace = "logout_dialog" },
    blur = true
})

hl.layer_rule({
    name = "swaync-center-blur",
    match = { namespace = "swaync-control-center" },
    blur = true,
    ignore_alpha = 0.5,
    xray = false
})

hl.layer_rule({
    name = "swaync-notification-blur",
    match = { namespace = "swaync-notification-window" },
    blur = true,
    ignore_alpha = 0.5,
    xray = false
})
