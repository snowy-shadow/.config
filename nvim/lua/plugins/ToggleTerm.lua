return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      direction = "float",
      shell = (vim.fn.has "win32" == 1 or vim.fn.has "win64" == 1)
          and (vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell")
        or vim.o.shell,

      float_opts = {
        border = "curved",
      },
    },
  },
}
