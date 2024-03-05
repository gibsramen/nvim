return {
    "nvim-lualine/lualine.nvim",
    dependences = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")

        lualine.setup {
            options = {
                icons_enabled = true,
                theme = "auto"
            }
        }
    end,
}
