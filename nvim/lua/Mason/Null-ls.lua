local null_ls = require "null-ls"

local diagnostics = null_ls.builtins.diagnostics
local format = null_ls.builtins.formatting

null_ls.setup(
{
	sources =
	{
		-- linter
		diagnostics.cppcheck,
		diagnostics.vale,

		-- formatter
		format.clang_format,
		format.stylua,
	}
})


