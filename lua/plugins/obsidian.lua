return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = false,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required
  },
  config = function()
    require("elaube.obsidian")
  end,
}
