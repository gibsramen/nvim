return {
    "stevearc/aerial.nvim",
    config = function()
        local aerial = require("aerial")

        aerial.setup({
          -- optionally use on_attach to set keymaps when aerial has attached to a buffer
          on_attach = function(bufnr)
            -- Jump forwards/backwards with '{' and '}'
            vim.keymap.set("n", "<leader>{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>}", "<cmd>AerialNext<CR>", { buffer = bufnr })
            vim.keymap.set("n", "<leader>ao", "<cmd>AerialOpen<CR>")
            vim.keymap.set("n", "<leader>ac", "<cmd>AerialClose<CR>")
            vim.keymap.set("n", "<leader>an", "<cmd>AerialNavToggle<CR>")
          end,
        })
    end,
}
