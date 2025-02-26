return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- configuration options
    lang = "javascript",

    storage = {
      home = vim.fn.stdpath("data") .. "/leetcode/",
    },

    logging = false,

    -- leetcode.nvim uses chrome as the default browser
    browser = "chrome",

    -- hide runtime result when submitting
    hide_runtime = false,

    -- Show test case for debugging
    debug = {
      enable = true,
      type = "float", -- float|popup|tab
    },

    -- Cache configuration for better performance
    cache_dir = vim.fn.stdpath("data") .. "/leetcode/cache/",
    cache = {
      enable = true,
      update_time = 604800, -- 7 days in seconds
    },
    -- Terminal toggle key for running code
    keys = {
      toggle = { "q", "<Esc>" }, -- quit terminal and menu
      confirm = { "<CR>" }, -- confirm selection
    },
  },
  -- Optional but recommended: installed treesitter parsers for better syntax highlighting
  config = function(_, opts)
    vim.keymap.set("n", "<leader>lc", "<cmd>Leet console<cr>", { desc = "Leetcode Console" })
    vim.keymap.set("n", "<leader>ll", "<cmd>Leet list<cr>", { desc = "Leetcode List Problems" })
    vim.keymap.set("n", "<leader>li", "<cmd>Leet info<cr>", { desc = "Leetcode Problem Info" })
    vim.keymap.set("n", "<leader>lr", "<cmd>Leet run<cr>", { desc = "Leetcode Run Code" })
    vim.keymap.set("n", "<leader>ls", "<cmd>Leet submit<cr>", { desc = "Leetcode Submit Code" })

    require("leetcode").setup(opts)
  end,
}
