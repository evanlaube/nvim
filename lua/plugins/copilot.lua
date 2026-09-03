return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        config = function()
            require("elaube.copilot").setup_copilot()
        end,
    },
}
