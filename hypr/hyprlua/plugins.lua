-- .config/hypr/hyprland.lua
hl.config({
    plugin = {
        scrolloverview = {
            gesture_distance = 300, -- how far is the "max" for the gesture
            scale = 0.5, -- preferred overview scale
            workspace_gap = 100,
            layout = "vertical", -- vertical, horizontal, or auto (per-monitor orientation)
            wallpaper = 2, -- 0: global only, 1: per-workspace only, 2: both
            blur = true, -- blur only the main overview wallpaper

            shadow = {
                enabled = true,
                range = 50,
            },
        },
    },
})

-- Toggle ScrollOverview with SUPER+g
hl.bind("SUPER + Tab", function()
    hl.plugin.scrolloverview.overview("toggle all")
end)


hl.config({
    plugin = {
        hyprbars = {
            bar_height = 30,
            on_double_click = "hyprctl dispatch fullscreen 1",
            bar_precedence_over_border = true,

        },
    },
})

hl.plugin.hyprbars.add_button({
    bg_color = "rgb(ff4040)",
    fg_color = "rgb(ffffff)",
    size = 15,
    icon = "",
    action = "hyprctl dispatch 'hl.dsp.window.close()'",
})

-- hl.plugin.hyprbars.add_button({
--     bg_color = "rgb(eeee11)",
--     fg_color = "rgb(000000)",
--     size = 20,
--     icon = "_",
--     action = [[hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })']],
-- })