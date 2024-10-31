-- custom/configs/null-ls.lua

local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.prettier,
  -- formatting.prettierd.with {
  --   filetypes = { "astro" },
  -- },
  formatting.prettierd,
  formatting.stylua,
  formatting.gofmt,
  formatting.goimports,

  lint.shellcheck,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

vim.cmd [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.astro lua vim.lsp.buf.format()
  augroup END
]]
