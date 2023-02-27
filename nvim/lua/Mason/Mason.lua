require "mason".setup(
{
    ui = {
		border = vim.g.border_chars,

        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
