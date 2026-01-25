return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["<M-'>"] = { function() require("toggleterm").toggle() end, desc = "toggle term open" },
        },
      },
    },
  },
}
