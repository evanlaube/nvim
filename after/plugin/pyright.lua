local lspconfig = require('lspconfig')

lspconfig.pyright.setup({
    root_dir = function(fname)
        return lspconfig.util.root_pattern('.git', 'setup.py', 'pyproject.toml')(fname)
               or vim.fn.getcwd()  -- Fallback to current working directory
    end,
    on_attach = function(client, bufnr)
        -- Optional: Add any custom keymaps or settings for when the LSP attaches
    end,
    settings = {
        python = {
            analysis = {
                -- These settings eliminate the need for pyrightconfig.json:
                autoSearchPaths = true,  -- Automatically find and use search paths (like venvs)
                useLibraryCodeForTypes = true,  -- Use library code for type inference
                diagnosticMode = "workspace",  -- 'workspace' means it checks all files, not just open ones
            }
        }
    }
})

