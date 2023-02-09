local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system
    {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

--[[ Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd
[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]
--]]

-- Use a protected call so we don't error out on first use
local packer = require("packer")
-- Have packer use a popup window
packer.init
{
    display =
    {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

local function load_config(configs)
	for _, config in ipairs(configs)
	do
		local ok, _ = pcall(require, config)

		if not ok
		then
			vim.notify("cannot load ".. config)
		end
	end
end

-- Install your plugins here
return packer.startup(function(use)
    -- Plugins here
    -- On start up
    use
    {
		"wbthomason/packer.nvim", -- Have packer manage itself

        -- Colorscheme
        -- "rebelot/kanagawa.nvim",
		"folke/tokyonight.nvim",

		-- startup
		"glepnir/dashboard-nvim",

        -- icons 
        "kyazdani42/nvim-web-devicons",

        -- status line
	    "feline-nvim/feline.nvim",

		-- bufferline
		"akinsho/bufferline.nvim",
		"moll/vim-bbye",

		-- notification manager
		"rcarriga/nvim-notify",

		-- improve startup time
		"lewis6991/impatient.nvim",

		-- scrollbar
		"petertriho/nvim-scrollbar",
    }

	use
	{
        "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
		module = "popup",
	}

	use
	{
        "nvim-lua/plenary.nvim", -- Useful lua functions used for lots of plugins
		module = "plenary",
	}

	use
	{
		cmd = { "Telescope", "telescope", },
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-telescope/telescope.nvim",
		run = "make",
		branch = "0.1.x",
		config = function ()
			require "Plugin.Telescope"
		end
	}

	use
	{
		event = "InsertEnter",
		-- lsp
        "hrsh7th/cmp-nvim-lsp",

		-- indent 
		"lukas-reineke/indent-blankline.nvim",

		-- autopair
		"windwp/nvim-autopairs",

		-- treesitter
		{
			"nvim-treesitter/nvim-treesitter",
			"nvim-treesitter/nvim-treesitter-context",
			run = ":TSUpdate",
		},

        -- LSP
        "neovim/nvim-lspconfig", -- enable LSP
		"williamboman/mason.nvim", -- linting auto installer
		"williamboman/mason-lspconfig.nvim",

		-- Null-ls
		"jose-elias-alvarez/null-ls.nvim",

        -- snippet engine
        "L3MON4D3/LuaSnip",

		config = load_config(
		{
			"Plugin.Indent",
			"Plugin.AutoPair",
			"Plugin.Treesitter",
			"Mason.Mason",
			"Mason.LSP",
			"Mason.Null-ls",
			"Plugin.AutoComplete"
		}),
	}

	use
	{
		after = "cmp-nvim-lsp",
        -- auto cmp
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
	}

	use
	{
		cmd = {"NvimTree",},
		"kyazdani42/nvim-tree.lua",
		config = load_config({"Plugin.Nvim-tree"})
	}

	use
	{
		"mfussenegger/nvim-dap",
		config = load_config({"Mason.DAP"})
	}

	use
	{
		-- latex
		"lervag/vimtex",
		ft = {"tex"},
		config = load_config({"Plugin.Vimtex"})
	}
    -- Auto cmd
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
