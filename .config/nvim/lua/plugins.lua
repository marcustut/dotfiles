-- bootstrapping (install packer on first load)
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

-- startup function for packer (to init packages)
return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- package manager

  use 'lewis6991/impatient.nvim' -- optimize lua 'require'

  -- colorscheme
  use 'folke/tokyonight.nvim' -- color tokyonight

  -- common
  use 'tpope/vim-fugitive' -- git commands
  use 'tpope/vim-surround' -- surround word
  use 'akinsho/toggleterm.nvim' -- toggle terminal
  use 'mg979/vim-visual-multi' -- multiple cursor

  -- language server
  use 'neovim/nvim-lspconfig'

  -- autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'

  -- snippet
  use 'L3MON4D3/LuaSnip'

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function() require'nvim-tree'.setup {}
  end }

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- emoji
  use { 'nvim-telescope/telescope-symbols.nvim' }

  -- utilities
  use 'wakatime/vim-wakatime' -- track code time
end)
