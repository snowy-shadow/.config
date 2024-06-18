return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    enabled = true,
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  {
    "nvim-telescope/telescope-project.nvim",
    keys = {
      {
        "<leader>fp",
        "<cmd>lua require('telescope').extensions.project.project{ display_type = 'full' }<cr>",
        desc = "Telescope Project",
      },
    },
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    keys = {
      { "<leader>tb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "Telescope file browser" },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    opt = {
      extensions = {
        project = {
          hidden_files = true, -- default: false
          order_by = "recent",
          search_by = "title",
          sync_with_nvim_tree = true, -- default false
        },

        file_browser = { hijck_netrw = true },
      },
    },
    config = function()
      require("telescope").load_extension "fzf"
      require("telescope").load_extension "project"
      require("telescope").load_extension "file_browser"
    end,
  },
}
