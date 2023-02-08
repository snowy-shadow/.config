require("mason").setup()
local mason_lsp = require "mason-lspconfig"
local lsp = require "lspconfig"
local cmp_lsp = require "cmp_nvim_lsp"

mason_lsp.setup {
    ensure_installed =
    {
        "clangd",
        "sumneko_lua",
		"rust_analyzer",
        "texlab",
		
    },

    automatic_installation = false,
}

-- change signs
local signs =
{
    { name = "DiagnosticSignError", text = " ▎" },
    { name = "DiagnosticSignWarn", text = " ▎" },
    { name = "DiagnosticSignHint", text = " ▎" },
    { name = "DiagnosticSignInfo", text = " ▎" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
-- diagnostic settings
vim.diagnostic.config(
{
    virtual_text = false,
	severity_sort = true,
    signs = { active = signs },

	underline =
	{
		severity = vim.diagnostic.severity.ERROR,
	},

    update_in_insert = true,
    float =
    {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

-- pop up diagnostic windows
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    {border = 'rounded'}
)

-- keymap
local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "ge", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<M-q>", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]],
      false)
    end
end

-- LSP server defaults
local lsp_defaults =
{
    flags =
    {
        debounce_text_changes = 150,
    },

    capabilities = cmp_lsp.default_capabilities(
    vim.lsp.protocol.make_client_capabilities()),

    on_attach = function(client, bufnr)
        lsp_keymaps(bufnr)
        lsp_highlight_document(client)
		client.server_capabilities.documentFormattingProvider = false
    end,

    virtual_text = false,
}

lsp.util.default_config = vim.tbl_deep_extend(
    'force',
    lsp.util.default_config,
    lsp_defaults
)

-- individual LSP servers settings
lsp.clangd.setup{}
lsp.texlab.setup{}
lsp.pyright.setup{}
lsp.rust_analyzer.setup{}

lsp.sumneko_lua.setup
{
	settings =
	{
		Lua =
		{
			diagnostics =
			{
				globals =
				{
					"vim"
				},
			},

			workspace =
			{
				library =
				{
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		}
	}
}

