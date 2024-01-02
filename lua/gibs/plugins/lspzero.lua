return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({buffer = bufnr})
        end)

        require("mason").setup({})
        require("mason-lspconfig").setup({
            handlers = {
                lsp_zero.default_setup,
            },
        })

        -- https://github.com/neovim/nvim-lspconfig/issues/2660
        local lspconfig = require("lspconfig")
        lspconfig.pylsp.setup {
            settings = {
                pylsp = {
                    plugins = {
                        flake8 = { enabled = true },
                        pycodestyle = { enabled = false },
                        mccabe = { enabled = false }
                    }
                }
            }
        }
    end,
}
