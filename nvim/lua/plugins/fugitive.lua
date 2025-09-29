return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>ga", ":G add .<CR>", { desc = "Git add ." })
    vim.keymap.set("n", "<leader>gl", ":G log<CR>", { desc = "Git log" })
    vim.keymap.set("n", "<leader>gs", ":G status<CR>", { desc = "Git status" })
  end,
}
