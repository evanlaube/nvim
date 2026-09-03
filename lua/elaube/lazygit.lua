local Terminal = require("toggleterm.terminal").Terminal

local config_path = vim.fn.stdpath("config") .. "/lazygit/config.yml"
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    float_opts = {
        border = "curved",
    },
    env = {
        LG_CONFIG_FILE = config_path,
    },
})

vim.keymap.set("n", "<leader>gs", function()
    lazygit:toggle()
end, { desc = "LazyGit" })
