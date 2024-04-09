local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins =
{
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts =
		{
			-- add any options here
		},
		config =
			function()
				require "custom.configs.noice"
				require "custom.configs.notify"
			end,
		dependencies =
		{
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
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
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = function()
		  return require "custom.configs.telescope"
		end,
		dependencies =
		{
			'nvim-telescope/telescope-fzf-native.nvim',
		},

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
		event = "VeryLazy",
		cmd = {"Copilot"},
	},
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
		  require("better_escape").setup()
		end,
	},

	{
		"karb94/neoscroll.nvim",
		config =
			function ()
				require "custom.configs.neoscroll"
			end
	},


	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	opts = overrides.treesitter,
	-- },
	--
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	opts = overrides.nvimtree,
	-- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

}

return plugins
