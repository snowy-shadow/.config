-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override =
{
	NvDashAscii =
	{
		bg ="none",
		fg ="light_grey"
	},
	NvDashButtons =
	{
		bg ="none",
		fg ="#FFB7C5"
	},
	Comment =
	{
		italic = false,
	},
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
