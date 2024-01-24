
function arrange()
    winCount = #vim.api.nvim_list_wins()

    while winCount > 1 do
        vim.cmd("q")
        winCount = winCount - 1
    end

    width = vim.api.nvim_win_get_width(0)
    height = vim.api.nvim_win_get_height(0)

    if height > 40 then
        vim.cmd("set splitbelow")
        vim.cmd("split term://zsh")
    end

    if width > 110 then
        vim.cmd("resize 15")
        vim.cmd("NERDTree")
    end
end
