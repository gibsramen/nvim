return {
    -- Make sure to install Nerd Fonts
    -- https://github.com/ryanoasis/nerd-fonts
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")

        lualine.setup {
            options = {
                icons_enabled = true,
                theme = "auto"
            },
            sections = {
                lualine_x = {"filetype"}
            }
        }
    end,
}
