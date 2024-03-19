local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins =
{
	{
		'nvimdev/dashboard-nvim',
		event = 'VimEnter',
		config = function()
		require('dashboard').setup
		{
			theme = 'hyper',
			config =
			{
				week_header =
				{
					enable = true,
				},
				shortcut =
				{
					{ desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
					{
						icon = ' ',
						icon_hl = '@variable',
						desc = 'Files',
						group = 'Label',
						action = 'Telescope find_files',
						key = 'f',
					},
					{
						desc = ' Apps',
						group = 'DiagnosticHint',
						action = 'Telescope app',
						key = 'a',
					},
					{
						desc = ' dotfiles',
						group = 'Number',
						action = 'Telescope dotfiles',
						key = 'd',
					},
				},
			},
		}
		end,
		dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},
	-- Override plugin definition options
	{
		"neovim/nvim-lspconfig",
		config = function()
		  require "plugins.configs.lspconfig"
		  require "custom.configs.lspconfig"
		end, -- Override to setup mason-lspconfig
	},

	{
		"hrsh7th/nvim-cmp",
		opts = function()
		  return require "custom.configs.cmp"
		end,
		config = function(_, opts)
		  require("cmp").setup(opts)
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
		config = function(_, opts)
		  dofile(vim.g.base46_cache .. "mason")
		  require("mason").setup(opts)

		  -- custom nvchad cmd to install all mason binaries listed
		  vim.api.nvim_create_user_command("MasonInstallAll", function()
			if opts.ensure_installed and #opts.ensure_installed > 0 then
			  vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
			end
		  end, {})

		  vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = function()
		  return require "custom.configs.telescope"
		end,
		config = function(_, opts)
		  dofile(vim.g.base46_cache .. "telescope")
		  local telescope = require "telescope"
		  telescope.setup(opts)

		  -- load extensions
		  for _, ext in ipairs(opts.extensions_list) do
			telescope.load_extension(ext)
		  end
		end,
	},

	-- Install a plugin
	{
		"github/copilot.vim",
		lazy = true,
		cmd = {"Copilot"},
	},
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
		  require("better_escape").setup()
		end,
	},


  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
	-- disable
	{
		"NvChad/Nvdash.lua",
		enabled = false
	},

}

return plugins
