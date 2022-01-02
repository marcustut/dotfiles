local lsp = require('languages.lsp')

require('lspconfig').efm.setup({
  root_dir = require('lspconfig').util.root_pattern('.git'),
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'python',
    'vue',
    'lua',
    'rust',
    'go',
    'json',
  },
  init_options = { documentFormatting = true, codeAction = true },
  settings = {
    rootMarkers = { '.git/' },
    languages = {
      javascript = require('languages.javascript').efm,
      javascriptreact = require('languages.javascript').efm,
      typescript = require('languages.typescript').efm,
      typescriptreact = require('languages.typescript').efm,
      python = require('languages.python').efm,
      vue = require('languages.vue').efm,
      lua = require('languages.lua').efm,
      rust = require('languages.rust').efm,
      go = require('languages.go').efm,
      json = require('languages.json').efm,
    },
  },
  on_attach = lsp.on_attach,
  capabilities = lsp.capabilities
})
