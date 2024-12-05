return {
   "ggandor/leap.nvim",
    config = function()
        local leap = require("leap")

        leap.create_default_mappings()
        leap.opts.special_keys = {
            next_target = '<enter>',
            prev_target = { '<backspace>', '<tab>' },
            next_group = ';',
            prev_group = { '<backspace>', '<tab>' },
        }
        vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
        vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
        vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
    end,
}
