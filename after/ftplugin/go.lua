vim.opt_local.expandtab = false

vim.keymap.set("n", "<leader>dt", ":lua require('dap-go').debug_test()<CR>")
