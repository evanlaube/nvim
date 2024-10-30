
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("python", {
  s("ifmain", {
    t("if __name__ == '__main__':"),
    t({"", "    "}),  -- Indentation for the next line
  }),
})
