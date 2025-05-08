
return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            require('elaube.treesitter')
        end
    },
    {'nvim-treesitter/playground'},
}
