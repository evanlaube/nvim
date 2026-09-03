

local function clock()
  return os.date('%I:%M:%S %p')
end

local function date()
    return os.date("%A %b %-d")
end

-- Hide in small window
local function hisw()
  return vim.fn.winwidth(0) > 40
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {{'mode', cond=hisw}},
    lualine_b = {{'branch', cond=hisw}, {'diff', cond=hisw}, {'diagnostics', cond=hisw}},
    lualine_c = {{'filename'}},
    lualine_x = {{date, cond=hisw}, {clock, cond=hisw}},
    lualine_y = {{'filetype', cond=hisw}},
    lualine_z = {{'location', cond=hisw}}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{'filename'}},
    lualine_x = {{'location', cond=hisw}},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
