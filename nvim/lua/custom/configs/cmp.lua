local cmp = require "cmp"
local options = require "plugins.configs.cmp"

options.presect = cmp.PreselectMode.None
options.completion = { completeopt = "menu,menuone,noselect" }

return options
