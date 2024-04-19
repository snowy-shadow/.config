---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui =
{
	transparency = true,
	lsp_semantic_tokens = true, -- needs nvim v0.9, just adds highlight groups for lsp semantic tokens
	theme = "rxyhn",
	theme_toggle = { "rxyhn", "one_light" },

	hl_override = highlights.override,
	hl_add = highlights.add,

	nvdash =
	{
		load_on_startup = true,
		header =
		{
		"                                                                               ",
		"                                                                               ",
		"                   *((##*                                                      ",
		"               /###%%#%&&&%,                           .%((//(/.			   ",
		"               #%%&&&&@@@@@@@*                        #%#&%@&%%##%%            ",
		"              &&&@@@@@@@@@@@@@   .**(/(,*,/,*,       &@@@@@@@@@&&%%%*          ",
		"              @@@@@@@@@@&@*                         %@@@@@@@@@@@@&&&&          ",
		"               @@@@%/,               ,                 /@&%@@@@@@@&&&*         ",
		"                &@,                 .                      /%@@@@@@@&.         ",
		"             .(..                  ,                         *#@@@@@#          ",
		"           .(                                                 .@@@@*           ",
		"           #                                                    (              ",
		"          ,             *%@%             .@@@@&*                 ,             ",
		"       *            /@@@@@@&            @@@@@@@@&                .*            ",
		"       ,            @@@@@@@@,   ...  .   .@@@@@@@@@                 /          ",
		"       /           @@@@@@/                  *&@@@@@&                           ",
		"      /           ,@&@@@.    %@@@@@@@@@,     .#@@@&&                 ,         ",
		"      #            (%%%/    *@@@@@@@@@%*      *&%#(*                 /         ",
		"      *        .     .           /                   , .,.                     ",
		"       .                /                     *                      *         ",
		"       *                #.    ./%,%/.      ,%                       /..        ",
		"       .,                                                        ,,*  *        ",
		"         %*                                 (%%#%%(,          *&*..    ,       ",
		"        ,/**#@%,**         ........ ...    #&&&@&&&%%%&(,#@@@@@&##%(%%#,,.     ",
		"       .%@@@@@@@@@@@@@@@@@@@@@@@&@@@@@@@@@(@@@@@@&&@@%&%%&&&#@@@@@@@@&&&%(,    ",
		"       (%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.@@@@@@@@@@@@@@@&&%&@%&@@@@@@@@@%#,   ",
		"     *&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@&%&&*&@@@@@@&&#.  ",
		"     &@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@@&@@@&&(@@@@@@&%* ",
		"   .#@@@@@@@@@@@@@@@@@@@@@@@@@@@&@@@%@@@(@@@@@@@@@@@@@@@@@@@@@@@@@&@@@@##@@@@#.",
		"   /@@@@@@@@@@@%%&%@&##%&#%/(@(&#%%###%&%@/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&/",
		"  @@@@@@@@@@%((/((**,.,,,,*,,.,*.*.,*,,,,.. @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/",
		" .@@@@@@@@@/.*   .                           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(",
		},

		-- buttons =
		-- {
		-- 	{ "  Projects", "Spc f -", "Telescope projects" },
		-- 	{ "  Find File", "Spc f f", "Telescope find_files" },
		-- 	{ "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
		-- 	{ "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
		-- 	{ "  Bookmarks", "Spc m a", "Telescope marks" },
		-- 	{ "  Mappings", "Spc c h", "NvCheatsheet" },
		-- },
	},

	cheatsheet = { theme = "grid" }, -- simple/grid

	statusline =
	{
		theme = "default",
		separator_style = "round",
		order = {"cursor"}
	},
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
