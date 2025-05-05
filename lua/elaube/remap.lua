vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Spell check keybinds
-- Correct with first suggestion
vim.api.nvim_set_keymap("n", "<leader>sf", "1z=", { noremap = true, silent = true })
-- Add to dictionary
vim.api.nvim_set_keymap("n", "<leader>sa", "zg", { noremap = true, silent = true })

-- Yank to system clipboard
vim.api.nvim_set_keymap("n", "<leader>y", "\"+y", { noremap = true, silent = true })
