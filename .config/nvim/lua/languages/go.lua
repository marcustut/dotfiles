local lsp = require('languages.lsp')
local M = {}

M.efm = {
  {
    formatCommand = 'goimport',
    formatStdin = true,
  },
  {
    formatCommand = 'gofumpt',
    formatStdin = true,
  }
}

M.all_format = { efm = 'Goimports   Gofumpt' }

M.default_format = 'efm'

M.lsp = {
  capabilities = lsp.capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
    },
  },
  on_attach = lsp.on_attach,
}

return M
