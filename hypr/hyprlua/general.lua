local mat = require("colors")
hl.config (

{
    general = {
        layout = "scrolling",
        gaps_out = {top = 10,left = 7,right = 7, bottom = 3},
        gaps_in = 5,
        border_size = 3,
        resize_on_border = true,
        extend_border_grab_area = 100,
        col = {
            active_border = mat.primary,
            inactive_border = mat.surface
        }
    },
    dwindle = {
        special_scale_factor = 0.9
    },
    scrolling = {
        direction = "right",
        focus_fit_method = 1,
        follow_min_visible = 1,
        explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
        fullscreen_on_one_column = false,
        wrap_focus = false,
        wrap_swapcol = false,
        column_width = 0.5,
    },

    binds = {
        hide_special_on_workspace_change = true,
        scroll_event_delay = 0,
        movefocus_cycles_fullscreen = true
    },

    cursor = {
        no_warps = true
    },


     misc = {
        disable_hyprland_logo = true,
        disable_autoreload = false,
        focus_on_activate = true
    },



}

)