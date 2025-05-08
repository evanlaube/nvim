-- bootstrap lazy.nvim
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

require("lazy").setup('plugins')

--     {
--
--     {
--         'nvim-telescope/telescope.nvim',
--         dependencies = { "nvim-lua/plenary.nvim" },
--     },
--
--     {'nvim-treesitter/nvim-treesitter'},
--     {'nvim-treesitter/playground'},
--
--     {
--         'folke/tokyonight.nvim',
--         name = 'tokyonight',
--         config = function()
--             vim.cmd('colorscheme tokyonight-night')
--         end
--     },
--
--     -- LSP
--     {
--         'VonHeikemen/lsp-zero.nvim',
--         dependencies = {
--             -- LSP Support
--             {'neovim/nvim-lspconfig'},
--  			{'williamboman/mason.nvim'},
--  			{'williamboman/mason-lspconfig.nvim'},
--
--  			-- Autocompletion
--  			{'hrsh7th/nvim-cmp'},
--  			{'hrsh7th/cmp-buffer'},
--  			{'hrsh7th/cmp-path'},
--  			{'saadparwaiz1/cmp_luasnip'},
--  			{'hrsh7th/cmp-nvim-lsp'},
--  			{'hrsh7th/cmp-nvim-lua'},
--
--  			-- Snippets
--  			{'L3MON4D3/LuaSnip'},
--  			{'rafamadriz/friendly-snippets'},
--  		},
--         config = function()
--             require("lsp-zero").setup()
--         end
--     },
--
--     {
--         'nvim-tree/nvim-tree.lua',
--         dependencies = {
--             'nvim-tree/nvim-web-devicons',
--         },
--     },
--
--     {'tpope/vim-fugitive'},
--
--
-- })
--
