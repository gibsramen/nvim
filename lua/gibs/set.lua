vim.opt.mouse = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.background = "dark"
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.list = true
vim.opt.listchars = "tab:|·,trail:·"

-- https://github.com/neovim/neovim/issues/12011#issuecomment-1605258302
vim.o.guicursor = table.concat({
  "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100"
}, ",")
