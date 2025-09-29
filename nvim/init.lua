vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- quick fix navigation
vim.keymap.set("n", "∆", "<cmd>cnext<CR>")
vim.keymap.set("n", "˚", "<cmd>cprev<CR>")

require("config.telescope.terminal")
require("config.telescope.timew")
require("config.telescope.hlyank")
