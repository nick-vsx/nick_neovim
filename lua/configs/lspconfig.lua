local config = {}

function config.setup()
  local lspconfig = require "lspconfig"

  -- 基本配置
  local default_config = {
    on_attach = function(client, bufnr)
      -- 启用格式化
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
      end
      
      -- 设置按键映射
      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    end,
    
    capabilities = vim.lsp.protocol.make_client_capabilities(),
  }

  -- 配置服务器
  local servers = { "html", "cssls" }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup(default_config)
  end
end

return config
