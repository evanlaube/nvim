local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local util = require('elaube.scripts.util')

-- Add snippet for 348 inclass problem
ls.add_snippets("tex", {
  ls.snippet("348inclass", {
      ls.text_node(util.read_template("348inclass.tex")),
  }),
})
