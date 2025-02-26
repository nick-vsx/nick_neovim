return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-media-files.nvim",
  },
  config = function()
    require("telescope").setup({
      extensions = {
        media_files = {
          filetypes = { "svg", "png", "jpg", "jpeg", "webp", "pdf", "mp4", "webm" },
          find_cmd = "rg", -- 使用 `rg` 來查找文件，或者用 "fd"
        },
      },
    })
    -- load telescope-media-files plugins
    require("telescope").load_extension("media_files")
  end,
}
