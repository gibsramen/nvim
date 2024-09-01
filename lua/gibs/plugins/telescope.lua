return {
    "nvim-telescope/telescope.nvim", tag = '0.1.5',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require("telescope.builtin")

        local keymap = vim.keymap
        keymap.set("n", "<leader>ff", builtin.find_files)
        keymap.set("n", "<leader>gf", builtin.git_files)
        keymap.set("n", "<leader>rg", builtin.live_grep)
        keymap.set("n", "<leader>fd", builtin.lsp_document_symbols)
        keymap.set("n", "<leader>fb", builtin.buffers)

        extensions = {
            aerial = {
                -- How to format the symbols
                format_symbol = function(symbol_path, filetype)
                    if filetype == "json" or filetype == "yaml" then
                        return table.concat(symbol_path, ".")
                    else
                        return symbol_path[#symbol_path]
                    end
                end,
                -- Available modes: symbols, lines, both
                show_columns = "both",
            },
        }
        keymap.set("n", "<leader>ft", require("telescope").extensions.aerial.aerial)
    end,
}
