local cmp = require "cmp"
local options = require "plugins.configs.cmp"

options.mapping["<CR>"] = cmp.mapping.confirm
{
	behavior = cmp.ConfirmBehavior.Insert,
	select = false
}
options.preselect = cmp.PreselectMode.None
options.completion = { completeopt = "menu,menuone,noselect" }

return options
