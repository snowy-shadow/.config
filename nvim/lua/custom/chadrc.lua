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
	"                                                                                  ",
	"                                                                                  ",
	"                      *((##*                                                      ",
	"                  /###%%#%&&&%,                           .%((//(/.              ",
	"                  #%%&&&&@@@@@@@*                        #%#&%@&%%##%%            ",
	"                 &&&@@@@@@@@@@@@@   .**(/(,*,/,*,       &@@@@@@@@@&&%%%*          ",
	"                 @@@@@@@@@@&@*                         %@@@@@@@@@@@@&&&&          ",
	"                  @@@@%/,               ,                 /@&%@@@@@@@&&&*         ",
	"                   &@,                 .                      /%@@@@@@@&.         ",
	"                .(..                  ,                         *#@@@@@#          ",
	"              .(                                                 .@@@@*           ",
	"              #                                                    (              ",
	"             ,             *%@%             .@@@@&*                 ,             ",
	"          *            /@@@@@@&            @@@@@@@@&                .*           ",
	"          ,            @@@@@@@@,   ...  .   .@@@@@@@@@                 /          ",
	"          /           @@@@@@/                  *&@@@@@&                           ",
	"         /           ,@&@@@.    %@@@@@@@@@,     .#@@@&&                 ,         ",
	"         #            (%%%/    *@@@@@@@@@%*      *&%#(*                 /         ",
	"         *        .     .           /                   , .,.                     ",
	"          .                /                     *                      *         ",
	"          *                #.    ./%,%/.      ,%                       /..        ",
	"          .,                                                        ,,*  *        ",
	"            %*                                 (%%#%%(,          *&*..    ,       ",
	"           ,/**#@%,**         ........ ...    #&&&@&&&%%%&(,#@@@@@&##%(%%#,,.     ",
	"          .%@@@@@@@@@@@@@@@@@@@@@@@&@@@@@@@@@(@@@@@@&&@@%&%%&&&#@@@@@@@@&&&%(,    ",
	"          (%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.@@@@@@@@@@@@@@@&&%&@%&@@@@@@@@@%#,   ",
	"        *&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@&%&&*&@@@@@@&&#.  ",
	"        &@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@@&@@@&&(@@@@@@&%* ",
	"      .#@@@@@@@@@@@@@@@@@@@@@@@@@@@&@@@%@@@(@@@@@@@@@@@@@@@@@@@@@@@@@&@@@@##@@@@#.",
	"      /@@@@@@@@@@@%%&%@&##%&#%/(@(&#%%###%&%@/@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&/",
	"     @@@@@@@@@@%((/((**,.,,,,*,,.,*.*.,*,,,,.. @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/",
	"    .@@@@@@@@@/.*   .                           @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@(",
		},

		buttons =
		{
			{ "  Find File", "Spc f f", "Telescope find_files" },
			{ "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
			{ "  Bookmarks", "Spc m a", "Telescope marks" }
		},
	},

	cheatsheet = { theme = "grid" }, -- simple/grid


	statusline =
	{
		theme = "default",
		separator_style = "round",
		order = {"file", "%=", "git", "%=", "diagnostics", "lsp", "cursor", "cwd"}
	}
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
