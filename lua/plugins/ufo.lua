
return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
      provider_selector = function(bufnr, filetype)
        return { "treesitter", "indent" }
      end,
    },
    config = function ()
        require('elaube.ufo')
    end
}
