local plugins = {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      require("configs.lspconfig").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "vim", "lua", "vimdoc",
          "html", "css", "javascript"
        },
      })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}

return plugins
