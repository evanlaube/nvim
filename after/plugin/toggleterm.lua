vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', { noremap = true, silent = true })

require("toggleterm").setup({
    direction = "float",
    float_opts = {
        border = "curved"
    },
})
