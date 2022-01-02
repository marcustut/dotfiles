local lsp = require('languages.lsp')
local M = {}

M.efm = {
    {
        formatCommand = 'prettier --tab-width=4 --use-tabs=false --stdin-filepath ${INPUT}',
        formatStdin = true,
    },
}

M.all_format = { efm = 'Prettier' }

M.default_format = 'efm'

M.lsp = {
    capabilities = lsp.capabilities,
    on_attach = lsp.on_attach,
    settings = {
        json = {
            -- Schemas https://www.schemastore.org
            schemas = {
              {
                fileMatch = {"package.json"},
                url = "https://json.schemastore.org/package.json"
              },
              {
                fileMatch = {"tsconfig*.json"},
                url = "https://json.schemastore.org/tsconfig.json"
              },
              {
                fileMatch = {
                  ".prettierrc",
                  ".prettierrc.json",
                  "prettier.config.json"
                },
                url = "https://json.schemastore.org/prettierrc.json"
              },
              {
                fileMatch = {".eslintrc", ".eslintrc.json"},
                url = "https://json.schemastore.org/eslintrc.json"
              },
              {
                fileMatch = {".babelrc", ".babelrc.json", "babel.config.json"},
                url = "https://json.schemastore.org/babelrc.json"
              },
              {
                fileMatch = {"lerna.json"},
                url = "https://json.schemastore.org/lerna.json"
              },
              {
                fileMatch = {"now.json", "vercel.json"},
                url = "https://json.schemastore.org/now.json"
              },
              {
                fileMatch = {
                  ".stylelintrc",
                  ".stylelintrc.json",
                  "stylelint.config.json"
                },
                url = "http://json.schemastore.org/stylelintrc.json"
              },
            }
        },
    },
}

return M
