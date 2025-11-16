-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.motion.flash-nvim" },

  -- language
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.haskell" },

  -- diagnostics
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },

  -- editing-suport
  { import = "astrocommunity.editing-support.nvim-context-vt" },
  { import = "astrocommunity.register.nvim-neoclip-lua" },
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },

  -- UI
  { import = "astrocommunity.utility.noice-nvim" },

  -- git
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.diffview-nvim" },
}
