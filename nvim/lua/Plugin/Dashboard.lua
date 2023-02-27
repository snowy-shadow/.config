-- local home = os.getenv('HOME')
local Dashboard = require('dashboard')

Dashboard.setup(
{
	theme = 'hyper',

	config = {
	  week_header = {
			enable = true,
	  },

	  shortcut = {
			{
				desc = ' Update',
				group = '@property',
				action = 'PackerInstallSync', 
				key = 'u' 
			},

			{
				desc = '  Directory',
				group = 'Folder',
				action = 'NvimTreeToggle',
				key = 'd',
			},

			{
				desc = ' Files',
				group = 'File',
				action = 'Telescope app',
				key = 'f',
			},

			--[[ {
				desc = ' dotfiles',
				group = 'Number',
				action = 'Telescope dotfiles',
				key = 'd',
			}, 
			]]
		},

		packages = {
			enable = false,
		},
	},
})


-- macos
-- db.preview_command = 'cat | lolcat -F 0.3'
-- linux
-- db.preview_command = 'ueberzug'

-- db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
-- db.preview_file_height = 12
-- db.preview_file_width = 80
--[[ db.custom_center =
{
	{
		icon = '  ',
		desc = 'Recently latest session                  ',
		shortcut = 'SPC s l',
		action ='SessionLoad'
	},
	{
		icon = '  ',
		desc = 'Recently opened files                   ',
		action =  'DashboardFindHistory',
		shortcut = 'SPC f h'
	},
	{
		icon = '  ',
		desc ='File Browser                            ',
		action =  'Telescope file_browser',
		shortcut = 'SPC f b'
	},
	{
		icon = '  ',
		desc = 'Find  File                              ',
		action = "telescope.builtin.find_files(require('telescope.themes').get_dropdown({ previewer = false }))",
		shortcut = 'SPC f f'
	},
	{
		icon = '  ',
		desc = 'Find  word                              ',
		action = 'Telescope live_grep',
		shortcut = 'SPC f w'
	},
	{
		icon = '  ',
		desc = 'Open Personal dotfiles                  ',
		action = 'Telescope dotfiles path=' .. home ..'/.config',
		shortcut = 'SPC f d'
	},
} --]]
