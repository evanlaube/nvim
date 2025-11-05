
-- Luasnip config
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/elaube/snippets/" })

local ls = require('luasnip')

-- Use old method of lspconfig, and mute deprecation warning
-- TODO: This needs to be revisited later and port all users of lsp to 
-- the new vim.lsp.* API.
-- This is mostly working in the current version, but some aspects break
-- compatibility with current lsp servers. Wait until this has been improved.
local lsp = require('lspconfig')
vim.g.lspconfig_use_deprecated = true

-- Mute lspconfig deprecation warnings
local notify = vim.notify
vim.notify = function(msg, ...)
  if msg:match("lspconfig") then
    return
  end
  notify(msg, ...)
end

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

local cmp = require('cmp')

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-n>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),

        ['<C-p>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

local lsp_defaults = require('lspconfig').util.default_config

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

-- LspAttach is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,
})

vim.diagnostic.config({
    virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN }, -- show warn and up
        spacing = 2,
        source = "if_many", -- show source if many diagnostics
        prefix = "->",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
})

require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    }
})

lsp.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

lsp.glsl_analyzer.setup({
    filetypes = { "glsl", "vert", "frag", "comp" },
})

require('lspconfig').clangd.setup {
  cmd = {
    "clangd",
    "--log=verbose",
    "--header-insertion=never",
    "--fallback-style=Google",
    "--tweaks=-xc++",
    "--tweaks=-std=c++20"
  },
}

vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show diagnostics under cursor" })
