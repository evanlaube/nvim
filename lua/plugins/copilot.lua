return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        config = function()
            require("elaube.copilot").setup_copilot()
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        event = "InsertEnter",
        dependencies = { "copilot.lua" },
        config = function()
            require("elaube.copilot").setup_copilot_cmp()
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = { "plenary.nvim" },
        config = function()
            require("elaube.copilot").setup_copilot_chat()
        end,
    },
}
