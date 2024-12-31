return {
    "rebelot/kanagawa.nvim",
    config = function()
        local kanagawa = require("kanagawa")
        kanagawa.setup({
            colors = {
                palette = {
                    sumiInk3 = "#0f1e27",
                    fujiWhite = "#dbd7bc",
                },
            },
        })
        -- Setup must be called before loading
        vim.cmd.colorscheme("kanagawa-wave")
    end,
}
