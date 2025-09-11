vim.o.number = true
vim.o.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

require('config.lazy')
require('remap')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', {clear = true}),
  callback = function()
    vim.highlight.on_yank()
  end,
})
