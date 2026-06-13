---@module 'hl'
-- You can split this configuration into multiple files
-- Create your files separately and then link them to this file like this:
-- source = ~/.cache/wal/colors-hyprland.conf


--## MONITORS ###
-- See https://wiki.hyprland.org/Configuring/Monitors/
-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("waybar")
    hl.exec_cmd("dunst")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hyprsunset")
end)

hl.monitor({
    output   = "",
    mode     = "1920x1080@75",
    position = "0x0",
    scale    = 1,
})

--## PROGRAMS ###

-- See https://wiki.hyprland.org/Configuring/Keywords/

local terminal = "kitty"
local fileManager = "nemo"
local menu = "rofi -show drun"
local browser = "helium-browser"


--## ENVIRONMENT VARIABLES ###

-- https://wiki.hyprland.org/Configuring/Environment-variables/

hl.env("XCURSOR_SIZE", 24)

hl.env("HYPRCURSOR_SIZE", 24)

--##################

--## PERMISSIONS ###

--##################

-- See https://wiki.hyprland.org/Configuring/Permissions/

-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly

-- for security reasons

-- ecosystem {

--   enforce_permissions = 1

-- }

--## LOOK AND FEEL ###

-- Refer to https://wiki.hyprland.org/Configuring/Variables/

-- https://wiki.hyprland.org/Configuring/Variables/#general

hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 10,
        border_size = 1,
        -- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,
        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "dwindle",
        col = {
            active_border = "rgba(FFFFFFaa)",
            inactive_border = "rgba(7c6f64aa)",
        },
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#decoration

hl.config({
    decoration = {
        rounding = 8,
        -- rounding_power = 6
        -- transparency of focused and unfocused windows
        active_opacity = 1,
        inactive_opacity = 1,
        shadow = {
            enabled = true,
            range = 40,
            render_power = 5,
            color = "rgba(00000060)",
            color_inactive = "rgba(00000025)",
        },
        -- https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
            enabled = false,
            size = 30,
            passes = 1,
            vibrancy = 0.20,
        },
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#animations

hl.config({
    animations = {
        enabled = false,
        -- https://wiki.hyprland.org/Configuring/Animations/ 
    },
})

-- Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/

-- "Smart gaps" / "No gaps when only"

-- uncomment all if you wish to use that.

-- workspace = w[tv1], gapsout:0, gapsin:0

-- workspace = f[1], gapsout:0, gapsin:0

-- windowrule = bordersize 0, floating:0, onworkspace:w[tv1]

-- windowrule = rounding 0, floating:0, onworkspace:w[tv1]

-- windowrule = bordersize 0, floating:0, onworkspace:f[1]

-- windowrule = rounding 0, floating:0, onworkspace:f[1]

-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more

hl.config({
  dwindle = {
      force_split                  = 0,
      preserve_split               = true,
      smart_split                  = false,
      smart_resizing               = true,
      permanent_direction_override = false,
      special_scale_factor         = 1,
      split_width_multiplier       = 1.0,
      use_active_for_splits        = true,
      default_split_ratio          = 1.0,
      split_bias                   = 0,
      precise_mouse_move           = false,
  },
})
-- https://wiki.hyprland.org/Configuring/Master-Layout/ for more

hl.config({
    master = {
        new_status = "master",
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#misc

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})

--## INPUT ###

-- https://wiki.hyprland.org/Configuring/Variables/#input

hl.config({
    input = {
        kb_layout = "br",
        accel_profile = "flat",
        follow_mouse = 1,
        force_no_accel = 1,
        sensitivity = 0, 
        ---1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = false,
        },
    },
})

-- https://wiki.hyprland.org/Configuring/Variables/#gestures

-- gestures {

--     workspace_swipe = false

-- }

-- https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more

hl.device({
    name = "logitech-g603",
    sensitivity = 1,
})

--## KEYBINDINGS ###

-- See https://wiki.hyprland.org/Configuring/Keywords/

local mainMod = "SUPER"

-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more

hl.bind("SUPER" .. " + " .. "W", hl.dsp.exec_cmd("~/wallpaper-rofi.sh"))

hl.bind("SUPER" .. " + " .. "V", hl.dsp.exec_cmd("cliphist list| rofi -dmenu -display-columns 2| cliphist decode| wl-copy"))

hl.bind(mainMod .. " + " .. "Return", hl.dsp.exec_cmd("kitty"))

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "Q", hl.dsp.window.close())

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "X", hl.dsp.exit())

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "L", hl.dsp.exec_cmd("hyprlock"))

hl.bind(mainMod .. " + " .. "E", hl.dsp.exec_cmd("nemo"))

	hl.bind(mainMod .. " + " .. "T", hl.dsp.window.float())

hl.bind(mainMod .. " + " .. "Space", hl.dsp.exec_cmd("rofi -show drun"))

hl.bind(mainMod .. " + " .. "P", hl.dsp.layout("togglesplit")) -- TODO: not working

hl.bind(mainMod .. " + " .. "B", hl.dsp.exec_cmd("helium-browser"))

hl.bind(mainMod .. " + " .. "F", hl.dsp.window.fullscreen())

-- Move focus with mainMod + arrow keys

hl.bind(mainMod .. " + " .. "left", hl.dsp.focus({ direction = "left" }))

hl.bind(mainMod .. " + " .. "right", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + " .. "up", hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + " .. "down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + " .. "h", hl.dsp.focus({ direction = "left" }))

hl.bind(mainMod .. " + " .. "l", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + " .. "k", hl.dsp.focus({ direction = "up" }))

hl.bind(mainMod .. " + " .. "j", hl.dsp.focus({ direction = "down" }))

-- Screenshot with hyprshot

hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

-- print and save to clipboard only

-- Switch workspaces with mainMod + [0-9]

hl.bind(mainMod .. " + " .. 1, hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + " .. 2, hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + " .. 3, hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + " .. 4, hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + " .. 5, hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + " .. 6, hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + " .. 7, hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + " .. 8, hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + " .. 9, hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + " .. 0, hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- script to launch waybar
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "R", hl.dsp.exec_cmd("~/.config/waybar/launch.sh"))
-- killall waybar processes
hl.bind(mainMod .. " + " .. "R", hl.dsp.exec_cmd("killall -SIGUSR1 waybar"))


-- Scroll through workspaces with mainMod + mouse scroll
hl.bind(mainMod .. " + " .. "mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + " .. "mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + Left Click/Right Click and dragging
hl.bind(mainMod .. " + " .. "mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + " .. "mouse:273", hl.dsp.window.resize(), { mouse = true })

--## WINDOWS AND WORKSPACES ###

-- https://wiki.hyprland.org/Configuring/Window-Rules/ for more

-- https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules
hl.bind(mainMod .. " + " .. "SHIFT" .. " + " .. "C", function()
    hl.dispatch(hl.dsp.window.float())
    hl.dispatch(hl.dsp.window.resize({ x = 1440, y = 860, relative = false }))
    hl.dispatch(hl.dsp.window.center())
end)

hl.window_rule({
    name  = "suppress-maximize-events",
    match = {
        class = ".*",
    },
})

hl.window_rule({
    name  = "fix-wayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = {
        class = "hyprland-run",
    },
    move = { 20, "monitor_h-120" },
    float = true,
})

--#### DARK MODE #####
-- for GTK3 and GTK4 apps
hl.on("config.reloaded", function()
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
end)

-- for Qt apps
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
