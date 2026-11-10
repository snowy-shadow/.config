---@type LazySpec
return {
  "yetone/avante.nvim",
  dependencies = {
    "ColinKennedy/mega.cmdparse",
    "ColinKennedy/mega.logging", -- mega.cmdparse depends on this
  },
  opts = {
    windows = { wrap = true },
    provider = "claude-code",
    acp_providers = {
      ["claude-code"] = {
        command = "claude-agent-acp.cmd", -- Windows npm shim
        args = {},
        env = {
          NODE_NO_WARNINGS = "1",
          -- pass these through so the adapter can find node and your Claude login
          PATH = os.getenv "PATH",
          USERPROFILE = os.getenv "USERPROFILE",
          APPDATA = os.getenv "APPDATA",
        },
      },
    },
  },
}
