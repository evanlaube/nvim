
local M = {}

function M.date()
    return os.date("%m-%d-%Y")
end

-- function M.read_template(template_name)
--   local template_path = "~/.config/nvim/latexTemplates/" .. template_name
--   local file = io.open(vim.fn.expand(template_path), "r")
--   if not file then
--     print("Error: Template file not found!")
--     return ""
--   end
--   local content = file:read("*all")
--   file:close()
--   return content
-- end

function M.read_template(template_name)
  local template_path = "~/.config/nvim/latexTemplates/" .. template_name
  local file = io.open(vim.fn.expand(template_path), "r")
  if not file then
    print("Error: Template file not found!")
    return ""
  end
  local content = file:read("*all")
  file:close()

  -- Split content into lines
  local lines = {}
  for line in content:gmatch("([^\n]*)\n?") do
    table.insert(lines, line)
  end

  -- Return the lines as a table (instead of a single string with newlines)
  return lines
end

return M
