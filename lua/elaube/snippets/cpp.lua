
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local util = require('elaube.scripts.util')


ls.add_snippets("cpp", {
     s("eecs348", {
        t(("/*")),
        t({"", " * Program: EECS Assignment "}), i(1), t((" - ")), i(2),
        t({"", " * Description: "}), i(3),
        t({"", " * Inputs: "}), i(4),
        t({"", " * Output: "}), i(5),
        t({"", " * Collaborators: "}), i(6),
        t({"", " * Other Sources: "}), i(7),
        t({"", " * Author: Evan Laube"}),
        t({"", ""}), -- Go to next line after
        f(function() return " * Date Created: " .. util.date() end, {}),
        t({"", " */"}),
        t({"", ""}), -- Go to next line after
     }),
    s({ trig = "bar", regTrig = false }, {
    f(function(_, snip)
        local line = vim.api.nvim_get_current_line()
        local indent = line:match('^%s*')
        local indent_width = vim.fn.strdisplaywidth(indent)
        local bar_length = math.max(0, 78 - indent_width)
        snip.bar_length = bar_length  -- Store for later use
        return "/*" .. string.rep("=", bar_length)
    end),
    t({ "", "" }),
    i(1, "Section Title"),
    t({ "", "" }),
    f(function(_, snip)
        local bar_length = snip.bar_length or 73  -- Fallback to default
        return string.rep("=", bar_length) .. "*/"
    end),
})
})
