vim.notify = require "notify"

vim.notify.setup(
{
	background_colour = "#000000",
	fps = 30,
	icons =
	{
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = ""
	},

	level = 2,

	--[[
	max_width = function ()
		local windwidth = vim.fn.winwidth(0)
		return math.floor(0.4 * windwidth)
	end,
	]]--

	render = "default",
	stages = "fade",
	timeout = 7000
})
--[[vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings")
	then
        return
    end

    vim.notify(msg, ...)
end
]]--



vim.cmd [[ command! Messages execute "Telescope notify" ]]
