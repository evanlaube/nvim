

require('autoclose').setup({
    keys = {
        ["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = {} },
    },

    options = {
        disabled_filetypes = { "text", "markdown"},
        pair_spaces = true,
    }
})
