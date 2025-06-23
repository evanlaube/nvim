local cfg = {

}

local lsp_signature = require("lsp_signature")

lsp_signature.setup({
  bind = true,              -- Enable signature 
  floating_window = false,
  floating_window_above_cur_line = true,
  fix_pos = false,
  hint_enable = true,
  hint_prefix = "🦝 ", -- A nice hint icon prefix
  hint_scheme = "Comment",
  max_height = 12,
  max_width = 80,
  handler_opts = {
    border = "rounded"
  },
  extra_trigger_chars = {"(", ","},
  toggle_key = nil,
  select_signature_key = nil,
  doc_lines = 1,
})
