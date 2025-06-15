
return {
        'folke/tokyonight.nvim',
        name = 'tokyonight',
        config = function()
            vim.cmd('colorscheme tokyonight-night')
            -- Comment out to keep solid background
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
}
