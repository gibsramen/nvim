return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.2",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "python", "vim", "query", "rust" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true }
        })
    end,
}
