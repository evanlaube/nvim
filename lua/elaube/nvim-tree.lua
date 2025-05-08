

require("nvim-tree").setup({
    view = {
        width = 30,
        side = "left",
        preserve_window_proportions = true,
    },
    renderer = {
        highlight_git = true,
        group_empty = true,
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
            },
        },
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
                picker = "default",
            },
        },
    },
})
    
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>n', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
