local Settings =
{
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 2,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    ignorecase = true,                       -- ignore case in search patterns
    mouse = "a",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
    showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
    showtabline = 1,                         -- always show tabs
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    termguicolors = true,                   -- set term gui colors (mac terminal doesn't support this)
    timeoutlen = 150,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                         -- enable persistent undo
    updatetime = 700,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = false,                        -- convert tabs to spaces
    shiftwidth = 4,                         -- x spaces inserted for each indentation
    tabstop = 4,                             -- insert x spaces for a tab
    cursorline = false,                       -- highlight the current line
    number = false,                           -- set numbered lines
    relativenumber = true,                  -- set relative numbered lines
    numberwidth = 4,                         -- set number column width to 2 {default 4}
    signcolumn = "number",                      -- always show the sign column, otherwise it would shift the text each time
    wrap = true,                            -- display lines as one long line
    scrolloff = 10,                           -- auto scroll down when cursor reaches certain position
    sidescrolloff = 14,
    shortmess = "cmxs",                         -- shorter messages
	laststatus = 3,
	showcmd = true,
}
for k, v in pairs(Settings) do
    vim.opt[k] = v
end

vim.cmd [[ set iskeyword+=- ]]                   -- one-word

--[[ netrw settings
vim.cmd "let g:netrw_winsize = 25"               -- percentage
vim.cmd "let g:netrw_keepdir = 0"                -- sync current and browsing dir
vim.cmd "let g:netrw_fastbrowse = 1"            -- cache already viewed dirs     
vim.cmd "let g:netrw_banner = 0"                -- netrw banner
]]--
