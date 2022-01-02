local cmp = require('cmp')
local luasnip = require('luasnip')
local fn = vim.fn
local lspKindIcons = require('theme').lspKindIcons

-- require('tabout').setup({
--   tabkey = '',
--   backwards_tabkey = ''
-- })

local replace_keycodes = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = fn.col('.') - 1
    if col == 0 or fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = {
    -- 'CTRL + Space' to trigger autocomplete
    ['<C-Space>'] = cmp.mapping.complete(),
    -- 'Enter' to confirm selection
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    -- 'Tab' to cycle through options
    ['<Tab>'] = function(_)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        fn.feedkeys(replace_keycodes('<Plug>luasnip-expand-or-jump'), '')
      elseif check_back_space() then
        fn.feedkeys(replace_keycodes('<Tab>'), 'n')
      else
        fn.feedkeys(replace_keycodes('<Plug>(Tabout)'))
      end
    end,
    -- 'Shift + Tab' to cycle through options in reverse
    ['<S-Tab>'] = function(_)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        fn.feedkeys(replace_keycodes('<Plug>luasnip-jump-prev'), '')
      elseif check_back_space() then
        fn.feedkeys(replace_keycodes('<C-d>'), 'i')
      else
        fn.feedkeys(replace_keycodes('<Plug>(TaboutBack)'))
      end
    end,
  },

  formatting = {
    format = function(_, vim_item)
      if string.len(vim_item.abbr) > 60 then
        vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
      end

      vim_item.kind = lspKindIcons[vim_item.kind]

      return vim_item
    end,
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }
  },

  documentation = {
    maxwidth = 30,
  }
})
