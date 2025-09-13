vim.o.number = true
vim.o.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

require('config.lazy')

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")

-- set alt+j, alt +k for quickfix navigation
vim.keymap.set("n", "∆", "<cmd>cnext<CR>")
vim.keymap.set("n", "˚", "<cmd>cprev<CR>")

-- Highlight when yanking (copy) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
