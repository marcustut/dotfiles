require('impatient')
require('plugins')

-- Setup plugins
require('setup.toggleterm')
require('setup.lspconfig')
require('setup.telescope')
require('setup.cmp')
require('setup.tree')

-- Setup lsp icons
require('lspicon')

local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require('config.utils')
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map

-- Leader/local leader
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip',
  'man',
  'matchit',
  'matchparen',
  'shada_plugin',
  'tarPlugin',
  'tar',
  'zipPlugin',
  'zip',
  'netrwPlugin',
}

for i = 1, 10 do
  g['loaded_' .. disabled_built_ins[i]] = 1
end

-- Settings
local buffer = { o, bo }
local window = { o, wo }
opt('guicursor', 'i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150')
opt('hidden', true)
opt('expandtab', true, buffer)
opt('shiftwidth', 2, buffer)
opt('softtabstop', 2, buffer)
opt('smartindent', true, buffer)
opt('number', true, window)
opt('relativenumber', true, window)

-- Colorscheme
opt('termguicolors', true)
opt('background', 'dark')
vim.g.tokyonight_style = 'night'
cmd [[colorscheme tokyonight]]

-- Autocommands
autocmd('numbertoggle', {
  [[ BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif ]],
  [[ BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif ]]
}, true)

-- Keybindings
local silent = { silent = true }

-- Quit, close buffers, etc.
map('n', '<leader>q', '<cmd>qa<cr>', silent)
map('n', '<leader>w', [[<cmd>lua require('utils.core').bufdelete()<cr>]], { silent = true, noremap = true })

-- Save buffer
map('n', '<leader>s', '<cmd>w<cr>', silent)

-- Format buffer
map('n', '<leader>f', [[<cmd>lua require('lsp.format').format()<cr>]], { silent = true, noremap = true })
map('v', '<leader>f', [[<cmd>lua require('lsp.format').range_format()<cr><esc>]], { silent = true, noremap = true })

-- Esc in the terminal
map('t', 'jj', [[<C-\><C-n>]])

-- Window movement
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

-- Telescope
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { silent = true, noremap = true })
map('n', '<leader>o', [[:lua require('telescope.builtin').buffers()<cr>]], { silent = true, noremap = true })
map('n', '<leader>t', [[:lua require('telescope.builtin').lsp_document_diagnostics()<cr>]], { silent = true, noremap = true })
map('n', '<leader>p', [[:lua require('telescope.builtin').find_files()<cr>]], { silent = true, noremap = true })
map('n', '<leader>a', [[<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>]], { silent = true, noremap = true })
map('n', '<leader>e', [[:lua require('telescope.builtin').symbols{ sources = {'gitmoji'} }<cr>]], { silent = true, noremap = true })
map('n', '<leader>x', [[:lua require('telescope.builtin').registers()<cr>]], { silent = true, noremap = true })

-- Git
map('n', '<leader>g', [[<cmd>lua require("utils.core").git_hover()<cr>]], { silent = true, noremap = true })
map('n', '<leader>b', [[<cmd> NvimTreeToggle<CR>]], { silent = true, noremap = true })
map('n', '<leader>br', [[<cmd> NvimTreeRefresh<CR>]], { silent = true, noremap = true })
