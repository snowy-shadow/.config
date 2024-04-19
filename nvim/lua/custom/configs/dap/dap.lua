local dap = require("dap")

local Adapter =
{
	lldb =
	{
		type = "executable",
		-- abs path
		command = "",
		name = "lldb",
	}
}
local Config =
{
	cpp =
	{
		{
			name = 'Launch',
			type = 'lldb',
			request = 'launch',
			program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
			args = {},

			-- 💀
			-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
			--
			--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
			--
			-- Otherwise you might get the following error:
			--
			--    Error on launch: Failed to attach to the target process
			--
			-- But you should be aware of the implications:
			-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
			-- runInTerminal = false,
		},
	}
}

for k, v in pairs(Adapter)
do
	dap.adapters[k] = v
end

for k, v in pairs(Config)
do
	dap.configurations[k] = v
end
