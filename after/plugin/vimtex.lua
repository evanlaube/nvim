-- Vimtex settings

-- Determine pdf viewer based on OS
local pdfViewer = nil

if vim.fn.executable("skimpdf") == 1 then
    pdfViewer = "skim"
elseif vim.fn.executable("zathura") == 1 then
    pdfViewer = "zathura"
end


vim.g.vimtex_view_method = pdfViewer  

vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
    continuous = 1,  -- Enables auto-compilation
    callback = 1,
    build_dir = '',
    options = {
        '-xelatex',  -- Use XeLaTeX 
        '-verbose',
        '-file-line-error',
        '-synctex=0', -- Disable generation of .synctex.gz files
        '-interaction=nonstopmode'
    },
}

-- Mapping to quickly open PDF
vim.api.nvim_set_keymap('n', '<leader>lv', ':VimtexCompile -g<CR>:VimtexView<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lc', ':VimtexStop<CR>:VimtexClean<CR>', { noremap = true, silent = true })

-- Enable spell checking inside of .tex files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_us"
        vim.opt_local.iskeyword:append("\\")  -- Treat backslashes as word characters
    end,
})

-- Allow for cleanup of all aux files, including .pdf file
vim.g.vimtex_compiler_clean_paths = {
    ".latex/%:t:r.*",
    "./%:t:r.pdf"
}

-- Set to remove pdf files when cleaning (THEY NOT LIKE US)
vim.g.vimtex_compiler_clean_suffixes = { "pdf" }
