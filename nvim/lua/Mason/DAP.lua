local Dap = require("dap")

--[[
Dap.adapters.python =
{
	type = "executable";
	command = os.getenv("HOME");
	args = {"-m", "debugpy.adapter"};
}
]]--
