
local kulala = require('kulala')

kulala.setup({
  default_view = "body",
  default_env = "dev",
  debug = false,
  formatters = {
    json = { "jq", "." },
    xml = { "xmllint", "--format", "-" },
    html = { "xmllint", "--format", "--html", "-" },
  },
  scratchpad = {
    default_env = "dev",
    file_path = nil, -- e.g., vim.fn.stdpath("data") .. "/kulala_scratchpad.http"
  },
  -- icons = {
  --   inlay = {
  --     loading = "⏳",
  --     done = "✅",
  --     error = "❌",
  --   },
  --   lualine = "🐼",
  -- },
})

-- Keymaps (optional - adjust to your preference)
vim.keymap.set("n", "<leader>kr", kulala.run, { desc = "Kulala: Run request" })
vim.keymap.set("n", "<leader>kt", kulala.toggle_view, { desc = "Kulala: Toggle view" })
vim.keymap.set("n", "<leader>kp", kulala.jump_prev, { desc = "Kulala: Jump to previous request" })
vim.keymap.set("n", "<leader>kn", kulala.jump_next, { desc = "Kulala: Jump to next request" })
vim.keymap.set("n", "<leader>ki", kulala.inspect, { desc = "Kulala: Inspect request" })
vim.keymap.set("n", "<leader>kc", kulala.copy, { desc = "Kulala: Copy request as cURL" })
-- vim.keymap.set("n", "<leader>ks", kulala.scratchpad, { desc = "Kulala: Open scratchpad" })

-- Variable to store the scratchpad buffer number
local scratchpad_buf = nil

vim.keymap.set("n", "<leader>ks", function()
  -- If we already have a scratchpad buffer, reuse it
  if scratchpad_buf and vim.api.nvim_buf_is_valid(scratchpad_buf) then
    vim.api.nvim_set_current_buf(scratchpad_buf)
  else
    -- Create new scratchpad
    kulala.scratchpad()
    scratchpad_buf = vim.api.nvim_get_current_buf()
    -- Set buffer options
    -- vim.defer_fn(function()
    --   vim.bo.buftype = "nofile"
    --   vim.bo.bufhidden = "hide"
    --   vim.bo.swapfile = false
    -- end, 50)
  end
end, { desc = "Kulala: Open scratchpad" })
