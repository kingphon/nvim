local conform = require "conform"
conform.setup {
  formatters_by_ft = {
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    svelte = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    lua = { "stylelua" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },

  vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    conform.format {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    }
  end),
  { desc = "Format file or range (in visual mode)" },
}
