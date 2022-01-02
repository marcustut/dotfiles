local lsp = require('lspconfig')

lsp.pyright.setup(require('languages.python').lsp)
lsp.volar.setup(require('languages.vue').lsp)
lsp.jsonls.setup(require('languages.json').lsp)
lsp.eslint.setup(require('languages.eslint').lsp)
lsp.sumneko_lua.setup(require('languages.lua').lsp)
lsp.rust_analyzer.setup(require('languages.rust').lsp)
lsp.gopls.setup(require('languages.go').lsp)
