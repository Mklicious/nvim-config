local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
  'nvim-lua/plenary.nvim',
  {
    'svrana/neosolarized.nvim',
    dependencies = { 'tjdevries/colorbuddy.nvim' }
  },
  'neovim/nvim-lspconfig',
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup {}
    end,
    build = ':MasonUpdate',
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'tsserver', 'lua_ls', 'tailwindcss' }
      }
    end,
  },
  'jayp0521/mason-null-ls.nvim',
  "jose-elias-alvarez/null-ls.nvim",
  'nvim-lualine/lualine.nvim',
  'onsails/lspkind-nvim',
  'L3MON4D3/LuaSnip',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/nvim-cmp',
  'windwp/nvim-ts-autotag',
  'windwp/nvim-autopairs',
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  }, -- dependency for better sorting performance
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x"
  }, -- fuzzy finder
  'akinsho/nvim-bufferline.lua',
  'norcalli/nvim-colorizer.lua',
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/nvim-treesitter',
  'nvim-tree/nvim-tree.lua',
  'christoomey/vim-tmux-navigator',
  'numToStr/Comment.nvim',
  {
    'echasnovski/mini.indentscope',
    config = function()
      require('mini.indentscope').setup()
    end,
  },
  {
    'echasnovski/mini.trailspace',
    config = function()
      require('mini.trailspace').setup()
    end,
  }
})
