require("config.lazy")
print("Greeting Sakolkiat")
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

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("n", "<leader>ee", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")

-- quick fix navigation
vim.keymap.set("n", "∆", "<cmd>cnext<CR>")
vim.keymap.set("n", "˚", "<cmd>cprev<CR>")

-- telescope
vim.keymap.set("n", "<space>ff", ":Telescope<CR>")
vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags)
vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files)
vim.keymap.set("n", "<space>fb", require("telescope.builtin").buffers)

-- fugitive (git)
vim.keymap.set("n", "<leader>ga", ":G add .<CR>")
vim.keymap.set("n", "<leader>gl", ":G log<CR>")
vim.keymap.set("n", "<leader>gs", ":G status<CR>")

-- comment
vim.keymap.set("n", "<leader>/", require("Comment.api").toggle.linewise.current, { desc = "Toggle comment" })

-- Highlight when yanking (copy) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
