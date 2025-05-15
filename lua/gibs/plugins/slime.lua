return {
    -- https://github.com/LazyVim/LazyVim/discussions/234
    "jpalardy/vim-slime",
    config = function ()
        vim.g.slime_target = "tmux"
        vim.g.slime_cell_delimiter = "# %%"
        vim.g.slime_bracketed_paste = 1
    end,
}
