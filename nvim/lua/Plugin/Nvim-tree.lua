local nvim_tree = require "nvim-tree"

local nvim_tree_config = require "nvim-tree.config"

-- user keymaps deprecate
local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup(
{
	disable_netrw = true,
	hijack_netrw = true,
	-- open_on_setup = false,
	-- ignore_ft_on_setup =
	-- {
	-- 	"startify",
	-- 	"dashboard",
	-- 	"alpha",
	-- },
	-- auto_close = true,
	open_on_tab = false,
	hijack_cursor = false,
	sync_root_with_cwd = true,
	hijack_directories =
	{
		enable = true,
		auto_open = true,
	},
	diagnostics =
	{
		enable = true,
		icons =
		{
		  hint = "",
		  info = "",
		  warning = "",
		  error = "",
		},
	},
	update_focused_file =
	{
		enable = true,
		update_root = true,
		ignore_list = {},
	},
	git =
	{
		enable = true,
		ignore = true,
		show_on_dirs = true,
		timeout = 500,
	},
	renderer =
	{
		highlight_git = true,
		root_folder_modifier = ":t",

		icons =
		{
			show =
			{
				git = true,
				folder = true,
				file = true,
				folder_arrow = true,
			},

			glyphs =
			{
				default = "",
				symlink = "",

				git =
				{
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},

				folder =
				{
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			}
		},
	},

	actions =
	{
		open_file =
		{
			resize_window = true,
			quit_on_open = false,
			window_picker =
			{
				enable = true,
			},
		},
	},

	view =
	{
		width = 30,
		-- height = 30,
		hide_root_folder = false,
		side = "left",
		mappings =
		{
			custom_only = false,
			list =
			{
				{ key = { "<CR>" }, cb = tree_cb "edit" },
				{ key = "v", cb = tree_cb "vsplit" },
			},
		},
		number = false,
		relativenumber = false,
		signcolumn = "auto",
	},

	filters =
	{
		custom =
		{
			".DS_Store",
		}
	}
})
