local neoscroll = require "neoscroll"
local config = require "neoscroll.config"

neoscroll.setup
({
	easing_function = "sine",
	mappings = {},
})

local jump_time_ms = 500
local mappings =
{
	["<C-;>"] = { "scroll", { "15", "true", jump_time_ms, "center" }},
	["<C-'>"] = { "scroll", { "15", "true", jump_time_ms, "center" }}
}

config.set_mappings(mappings)
