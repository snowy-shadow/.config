---@type MappingsTable
local M = {}

M.telescope_project =
{
	n =
	{
		["<leader>f-"] = { ":lua require('telescope').extensions.project.project{ display_type = 'full' }<CR>", "Telescope Project" },
	}
}

M.telescope_file_browser =
{
	n =
	{
		["<leader>tb"] = { ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "Telescope file browser" },
	}
}

return M
