
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local util = require('elaube.scripts.util')

ls.add_snippets("python", {
    s("ifmain", {
        t("if __name__ == '__main__':"),
        t({"", "    "}),  -- Indentation for the next line
    }),

    s("eecs210", {
        t(("'''")),
        t({"", "Name: Evan Laube"}),
        t({"", "KUID: "}), i(1),
        t({"", "Lab Session: Monday 11:00 AM"}),
        t({"", "Lab Assignment: "}), i(2),
        t({"", "Description: "}), i(3),
        t({"", "Collaborators: "}), i(4),
        t({"", "'''"}),
        t({"", ""}), -- Go to next line after
    }),

    s("eecs268", {
        t(("'''")),
        t({"", "Author: Evan Laube"}),
        t({"", "KUID: "}), i(1),
        t({"", ""}), -- Go to next line after
        f(function() return "Date: " .. util.date() end, {}),
        t({"", "Lab: "}), i(2),
        t({"", ""}), -- Go to next line after
        f(function() return "Last Modified: " .. util.date() end, {}),
        t({"", "Purpose: "}), i(3),
        t({"", "'''"}),
        t({"", ""}), -- Go to next line after
    }),

     s("eecs348", {
        t(("'''")),
        t({"", "Program: EECS Assignment "}), i(1), t((" - ")), i(2),
        t({"", "Description: "}), i(3),
        t({"", "Inputs: "}), i(4),
        t({"", "Output: "}), i(5),
        t({"", "Collaborators: "}), i(6),
        t({"", "Other Sources: "}), i(7),
        t({"", "Author: Evan Laube"}),
        t({"", ""}), -- Go to next line after
        f(function() return "Last Modified: " .. util.date() end, {}),
        t({"", "'''"}),
        t({"", ""}), -- Go to next line after
     })
})
