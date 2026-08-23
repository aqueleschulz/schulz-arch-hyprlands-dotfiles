-- ~/.config/hypr/lua/autostart.lua
---@module 'hl'

-- Autostart necessary processes via callback event
hl.on("hyprland.start", function ()
hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
hl.exec_cmd("systemctl --user start hyprpolkitagent")
hl.exec_cmd("nm-applet")
hl.exec_cmd("blueman-applet")
hl.exec_cmd("waybar")
hl.exec_cmd("swaync")
hl.exec_cmd("hypridle")
hl.exec_cmd("awww-daemon")
hl.exec_cmd("awww img ~/Pictures/Wallpapers/EVA4.png --transition-type simple")
hl.exec_cmd("~/.config/hypr/scripts/autostart.sh")
hl.exec_cmd("[workspace 1 silent] kitty -e btop")
hl.exec_cmd("[workspace 1 silent] kitty -e unimatrix")
end)
