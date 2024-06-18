-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.catppuccin" },

  -- language
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.cmake" },

  -- diagnostics
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },

  -- editing-suport
  { import = "astrocommunity.editing-support.nvim-context-vt" },

  { import = "astrocommunity.register.nvim-neoclip-lua" },

  -- UI
  { import = "astrocommunity.utility.noice-nvim" },

  -- import/override with your plugins folder
}
