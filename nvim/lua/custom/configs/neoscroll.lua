local neoscroll = require "neoscroll"
local config = require "neoscroll.config"

neoscroll.setup
({
	easing_function = "sine",
	mappings = {},
})

local jump_time_ms = 200
local mappings =
{
	["<C-;>"] = { "scroll", { "-vim.wo.scroll", "true", jump_time_ms, "center" }},
	["<C-'>"] = { "scroll", { "-vim.wo.scroll", "true", jump_time_ms, "center" }}
}

config.set_mappings(mappings)
