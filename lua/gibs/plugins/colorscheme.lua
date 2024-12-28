return {
    "rebelot/kanagawa.nvim",
    config = function()
        local kanagawa = require("kanagawa")
        kanagawa.setup({
            colors = {
                palette = {
                    sumiInk3 = "#0f1e27",
                },
            },
        })
        -- Setup must be called before loading
        vim.cmd.colorscheme("kanagawa-wave")
    end,
}
