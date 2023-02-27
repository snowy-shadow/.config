local null_ls = require "null-ls"

local Diagnostics = null_ls.builtins.diagnostics
local Format = null_ls.builtins.formatting

null_ls.setup(
{
	sources = {
		-- linter
		Diagnostics.cppcheck,
		Diagnostics.vale,
		Diagnostics.pylint,

		-- formatter
		Format.clang_format,
	}
})


