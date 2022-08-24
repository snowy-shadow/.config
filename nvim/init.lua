local requirements =
{
	"impatient",
	"Plugin.Dashboard",
	"Keymap.Keymap",
	"Plugin.Notify",
	"Setting.Colorscheme",
	"Plugin.Plugins",
	"Setting.Settings",
	"Plugin.Bufferline",
	"Plugin.Scrollbar",
}

for _, req in ipairs(requirements) do
	local ok, _ = pcall(require, req)
	if not ok then
		vim.notify("cannot load " .. req)
	end
end
