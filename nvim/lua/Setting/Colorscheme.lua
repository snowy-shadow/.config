local colorscheme = "kanagawa"
local setting = require (colorscheme)
setting.setup(
{
    commentStyle = { italic = false },
	keywordStyle = { italic = false },
	statementStyle = { bold = true },
	variablebuiltinStyle = { italic = true },
})

vim.cmd ("colorscheme " .. colorscheme)
vim.cmd ("hi Normal ctermbg=none guibg=none")

-- status bar
require ("feline").setup()
-- require ("feline").winbar.setup() -- nvim 0.8 and up
