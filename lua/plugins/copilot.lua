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
    -- {
    --     "CopilotC-Nvim/CopilotChat.nvim",
    --     dependencies = { "plenary.nvim" },
    --     config = function()
    --         require("elaube.copilot").setup_copilot_chat()
    --     end,
    -- },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-telescope/telescope.nvim",
            "echasnovski/mini.icons",
        },
        config = function()
            require("elaube.copilot").setup_avante()
        end,
    }
}
