local wezterm = require "wezterm"

return
{
    -- Font
    font = wezterm.font(
    {
        family = "Fira Code",
        weight = "Regular",
        harfbuzz_features = 
        {
            "cv01",
            "cv02",
            "cv11",
            "ss04",
            "ss05",
            "ss02",
            "ss07",
            "ss09"
        }
    }),
    font_size = 14.5,
    -- Colorscheme
    color_scheme = "kanagawabones",

    -- terminal window
    hide_tab_bar_if_only_one_tab = true,

    -- Scroll back, consumes RAM
    scrollback_lines = 3500,

    -- Window padding
    window_padding =
    {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    -- tab
    use_fancy_tab_bar = true,

    -- inital window size
    initial_cols = 100,
    initial_rows = 30,

    window_background_image = "/Users/kuang/Pictures/Scenery/anime-night-sky-scenery-comet.jpg",
    window_background_image_hsb =
    {
        brightness = 0.02,
        hue = 1.0,
        saturation = 1.0,
    },

}
