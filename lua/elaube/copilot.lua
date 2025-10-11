local M = {}

function M.setup_copilot()
    require("copilot").setup({
        suggestion = {
            enabled = true,
            auto_trigger = true,
            debounce = 75,
            keymap = {
                accept = "<C-l>",
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
            },
        },
        panel = { enabled = true },
    })
end

function M.setup_copilot_cmp()
    require("copilot_cmp").setup()
end

function M.setup_copilot_chat()
    require("CopilotChat").setup({
        dubug = false,
        window = {
            layout = "float",
            relative = "cursor",
            border = "rounded",
            width = 0.5,
            height = 0.5,
            row = 1,
        },
        mappings = {
            reset = "<C-r>",
            submit = "<CR>",
            accept_diff = "<C-l>",
            show_diff = "gd",
        },
        context = {
            include_file_header = true,
            include_code_selection = true,
            max_lines = 300,
        },
    })

    vim.keymap.set("n", "<leader>cc", function()
        require("CopilotChat").toggle()
    end, { desc = "Toggle Copilot Chat" })
end

return M
