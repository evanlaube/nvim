return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        branch = "v1.x",
        opts = {},
    },

    -- Luasnip
    {
        "L3MON4D3/LuaSnip",
        run = "make install_jsregexp",
    },

    {
        "saadparwaiz1/cmp_luasnip"
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = {'LspInfo', 'LspInstall', 'LspStart'},
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
            {
                'williamboman/mason.nvim',
                branch="v1.x"
            },
            {
                'williamboman/mason-lspconfig.nvim',
                branch="v1.x"
            },
        },
        init = function()
            vim.opt.signcolumn = 'yes'
        end,
        config = function()
            require("elaube.lsp")
        end
    }
}


