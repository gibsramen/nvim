return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    PATH = "append",
    config = function()
        require("mason").setup({})
    end,
}
