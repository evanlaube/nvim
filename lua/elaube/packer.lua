-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')

	use({
		'folke/tokyonight.nvim',
		as = 'tokyonight',
		config = function()
			vim.cmd('colorscheme tokyonight-night')
		end

	})

	-- lsp stuff
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use('tpope/vim-fugitive')
    use('m4xshen/autoclose.nvim')
    -- use('preservim/nerdtree')
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
    use{'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim'}
    use({"iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end})

    use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
    })
    
    use 'lervag/vimtex'
    use 'github/copilot.vim' -- Trying this out for now - not sure how I feel
    use 'lewis6991/gitsigns.nvim'
    use 'godlygeek/tabular'
    use {"akinsho/toggleterm.nvim", tag = "*"}

end)

