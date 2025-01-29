require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/elaube/snippets/" })

local ls = require('luasnip')
local cmp = require('cmp')

-- Tab to jump to the next placeholder
vim.keymap.set({"i", "s"}, "<Tab>", function()
    if ls.expand_or_jumpable() then
        return "<Cmd>lua require('luasnip').expand_or_jump()<CR>"
    else
        return "<Tab>"
    end
end, {expr = true, silent = true})

-- Shift-Tab to jump to the previous placeholder
vim.keymap.set({"i", "s"}, "<S-Tab>", function()
    if ls.jumpable(-1) then
        return "<Cmd>lua require('luasnip').jump(-1)<CR>"
    else
        return "<S-Tab>"
    end
end, {expr = true, silent = true})
