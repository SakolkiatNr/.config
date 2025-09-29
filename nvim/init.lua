require("config.lazy")
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 5
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.winborder = "rounded"
vim.cmd("colorscheme vague")

-- core
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>ee", "<cmd>Oil<CR>", { desc = "Explore" })
vim.keymap.set("n", "<leader><space>x", "<cmd>source %<CR>", { desc = "reload config" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Execute current lua command" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- quick fix navigation
vim.keymap.set("n", "∆", "<cmd>cnext<CR>")
vim.keymap.set("n", "˚", "<cmd>cprev<CR>")

require("config.telescope.terminal")
require("config.telescope.timew")
require("config.telescope.hlyank")
