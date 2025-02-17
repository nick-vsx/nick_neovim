vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

-- load plugins
local plugins = {
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    priority = 1000,
  },
}

local custom_plugins = require("configs")
for _, plugin in ipairs(custom_plugins) do
  table.insert(plugins, plugin)
end

require("lazy").setup(plugins, {
  defaults = { lazy = true },
  install = { colorscheme = { "nvchad" } },
  ui = {
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin", "tohtml", "getscript", "getscriptPlugin", 
        "gzip", "logipat", "netrw", "netrwPlugin", "netrwSettings",
        "netrwFileHandlers", "matchit", "tar", "tarPlugin",
        "rrhelper", "spellfile_plugin", "vimball", "vimballPlugin",
        "zip", "zipPlugin", "tutor", "rplugin", "syntax", "synmenu",
        "optwin", "compiler", "bugreport", "ftplugin",
      },
    },
  },
})

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
