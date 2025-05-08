return {
    'numToStr/comment.nvim',
    config = function()
        require('Comment').setup()

        vim.keymap.set('n', '<leader>/', 'gcc', { remap = true })
        vim.keymap.set('v', '<leader>/', 'gc', { remap = true })
    end

}
