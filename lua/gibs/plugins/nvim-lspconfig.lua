return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.pyright.setup {
            settings = {
                pyright = {
                    reportUnusedImport = false
                }
            }
        }
    end,
}
