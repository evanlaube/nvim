vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
