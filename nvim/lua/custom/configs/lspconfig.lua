local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- capabilities.offsetEncoding = { "utf-16" }

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers =
{
    "java_language_server", "cmake", "lua_ls"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup
	{
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

lspconfig.clangd.setup
{
	on_attach = on_attach,
	capabilities = capabilities,
	cmd =
	{
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--clang-tidy-checks=*",
		"--all-scopes-completion",
		"--cross-file-rename",
		"--completion-style=detailed",
		"--header-insertion-decorators",
		"--header-insertion=iwyu",
		"--pch-storage=memory",
	}
}
