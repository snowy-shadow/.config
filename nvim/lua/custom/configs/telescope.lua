local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },

  extensions_list = { "themes", "terms" },

	extensions =
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
}

return options
