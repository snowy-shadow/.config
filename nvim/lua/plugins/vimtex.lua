-- LaTeX: VimTeX compiles (latexmk + LuaLaTeX, biber runs automatically) and views in SumatraPDF;
-- texlab LSP provides \cite{}/\ref{} completion from .bib files and diagnostics.
-- <localleader>ll = compile (continuous), <localleader>lv = view, <localleader>le = errors
---@type LazySpec
return {
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk_engines = { _ = "-lualatex" }

      vim.g.vimtex_view_general_viewer = "S:/Dev/Tools/SumatraPDF/SumatraPDF.exe"
      vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "texlab" })
    end,
  },
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.treesitter = opts.treesitter or {}
      opts.treesitter.ensure_installed =
        require("astrocore").list_insert_unique(opts.treesitter.ensure_installed, { "bibtex" })
      -- VimTeX provides its own LaTeX syntax (needed for math-zone detection, conceal, etc.),
      -- so keep treesitter highlighting off for latex
      local hl = opts.treesitter.highlight
      if hl == nil then hl = true end
      opts.treesitter.highlight = function(lang, bufnr)
        if lang == "latex" then return false end
        if type(hl) == "function" then return hl(lang, bufnr) end
        if type(hl) == "table" then return vim.tbl_contains(hl, lang) end
        return hl
      end
    end,
  },
}
