local Options = require "plugins.configs.telescope"

-- Options.defaults.initial_mode = "normal"
local ExtensionConfig =
{
	fzf =
	{
		fuzzy = true,                    -- false will only do exact matching
		override_generic_sorter = true,  -- override the generic sorter
		override_file_sorter = true,     -- override the file sorter
		case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
									   -- the default case_mode is "smart_case"
	},
	project =
	{
		-- base_dirs =
		-- {
		-- 	'~/dev/src',
		-- 	{'~/dev/src2'},
		-- 	{'~/dev/src3', max_depth = 4},
		-- 	{path = '~/dev/src4'},
		-- 	{path = '~/dev/src5', max_depth = 2},
		-- },
		-- theme = "dropdown",
		-- default for on_project_selected = find project files
		-- on_project_selected = function(prompt_bufnr)
		-- -- Do anything you want in here. For example:
		-- project_actions.change_working_directory(prompt_bufnr, false)
		-- require("harpoon.ui").nav_file(1)
		-- end
		hidden_files = false, -- default: false
		order_by = "recent",
		search_by = "title",
		sync_with_nvim_tree = true, -- default false
	},

	file_browser =
	{
		hijck_netrw = true,
	}
}

-- create the entry and append configs
Options.extensions = {}
for k, v in pairs(ExtensionConfig)
do
	Options.extensions[k] = v
end
return Options
