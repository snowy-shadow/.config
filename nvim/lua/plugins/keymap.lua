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
        t = {
          ["jk"] = { [[<C-\><C-n>]], desc = "toggle term normal mode" },
        },
      },
    },
  },
}
