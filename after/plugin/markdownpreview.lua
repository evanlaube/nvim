
-- Enable spell checking inside of .md files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "md",
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_us"
    end,
})
