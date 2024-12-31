-- Used so spacebar doesn't have a delay before advancing
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>n", ":cnext<CR>")
vim.keymap.set("n", "<leader>p", ":cprev<CR>")

vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-l>", "<C-W>l")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "dl", "0D")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Used to exit floating windows that are jumped into
vim.keymap.set("n", "<C-q>", ":close<CR>")

vim.keymap.set("n", "<leader>d", ":bp|bd #<CR>")

-- NVIM 0.10 added these default mappings for traversing diagnostics
-- but they default to non-floating windows.
vim.keymap.set('n', ']d', function()
    vim.diagnostic.goto_next({ float = { border = 'rounded' } })
    end, {
        desc = 'Jump to the next diagnostic with the highest severity',
    }
)
vim.keymap.set('n', '[d', function()
    vim.diagnostic.goto_prev({ float = { border = 'rounded' } })
    end, {
        desc = 'Jump to the previous diagnostic with the highest severity',
    }
)
