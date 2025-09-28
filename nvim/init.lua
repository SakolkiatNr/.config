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
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "reload config" })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Execute current lua command" })
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
vim.keymap.set("n", "<space>ff", ":Telescope<CR>", { desc = "Open Telescope" })
vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags, { desc = "Search help" })
vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files, { desc = "Search directories" })
vim.keymap.set("n", "<space>fb", require("telescope.builtin").buffers, { desc = "Search active buffers" })

-- fugitive (git)
vim.keymap.set("n", "<leader>ga", ":G add .<CR>", { desc = "Git add ." })
vim.keymap.set("n", "<leader>gl", ":G log<CR>", { desc = "Git log" })
vim.keymap.set("n", "<leader>gs", ":G status<CR>", { desc = "Git status" })

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
