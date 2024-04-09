local noice = require "noice"

noice.setup(
{
	presets =
	{
		-- long_message_to_split = true,
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true
	},

	lsp =
	{
		hover = {enabled = false },
		signature = {enabled = false },
	},
	views =
	{
		cmdline_popup =
		{
			border =
			{
				style = "none",
				padding = { 2, 3 },
			},
			filter_options = {},
		},
		popupmenu =
		{
			relative = "editor",
			position =
			{
			--	row = 8,
				col = "50%",
			},
			-- size =
			-- {
			-- 	width = 60,
			-- 	height = 10,
			-- },
			border =
			{
				style = "rounded",
				padding = { 0, 1 },
			},
		},

		win_options = { winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder", },

	},
	cmdline =
	{
		format =
		{
			search_down = { view = "cmdline",},
			search_up = { view = "cmdline", },
		},
    },
	-- routes =
	-- {
	-- 	{
	-- 		filter =
	-- 		{
	-- 			event = "msg_show",
	-- 			kind = "",
	-- 			find = "written",
	-- 		},
	-- 		opts = { skip = true },
	-- 	},
	-- },

})
