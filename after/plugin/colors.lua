
function colorSetup(color) 
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)

    -- Uncomment to give back transparent background, but getting rid of colorscheme bg color
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

colorSetup()
