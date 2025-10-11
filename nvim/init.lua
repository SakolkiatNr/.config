require("config.lazy")
require("config.telescope.terminal")
require("config.telescope.timew")
require("config.telescope.hlyank")

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
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics" })
vim.keymap.set("n", "<leader>bda", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current buffer" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- quick fix navigation
vim.keymap.set("n", "<M-n>", "<cmd>lnext<CR>", { desc = "Next diagnostic location" })
vim.keymap.set("n", "<M-p>", "<cmd>lprev<CR>", { desc = "Previous diagnostic location" })
vim.keymap.set("n", "<M-n>", "<cmd>cnext<CR>", { desc = "Next quiCk fix" })
vim.keymap.set("n", "<M-p>", "<cmd>cprev<CR>", { desc = "Previous quiCk fix" })

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope<CR>", { desc = "Open Telescope" })
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Search help" })
vim.keymap.set("n", "<leader>fd", require("telescope.builtin").find_files, { desc = "Search directories" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Search active buffers" })
vim.keymap.set("n", "<leader>km", require("telescope.builtin").keymaps, { desc = "Search keymaps" })
